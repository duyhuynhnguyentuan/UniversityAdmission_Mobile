//
//  AuthViewModel.swift
//  UniversityAdmission
//
//  Created by Duy Huỳnh Nguyễn Tuấn on 13/03/2024.
//

import Foundation
import SwiftUI


//Library for biometric authentication
import LocalAuthentication

class AuthViewModel: ObservableObject {
    //specify whether your devices support any biometrics
    enum BiometricType {
        case none
        case face
        case touch
        case optic
    }
    //handling types of errors
    enum AuthenticationError : Error, LocalizedError, Identifiable, Equatable {
        case invalidCredentials
        case deniedAccess
        case custom(errorMessage: String)
        case noFaceIDEnrolled
        case noFingerprintEnrolled
        case noOpticIdEnrolled
        case biometricError
        case credentialsNotSaved
        var id: String{
            self.localizedDescription
        }
        
        var errorDescription: String?{
            switch self{
            case .invalidCredentials:
                return NSLocalizedString("Either your email or password not correct", comment: "Try again")
            case .deniedAccess:
                return NSLocalizedString("Bạn đã từ chối truy cập sinh trắc học, hãy vào Cài đặt -> UniSeeker. -> Cho phép sử dụng FaceID", comment: "")
            case .custom(errorMessage: let errorMessage):
                return NSLocalizedString("\(errorMessage)", comment: "")
            case .noFaceIDEnrolled:
                return NSLocalizedString("Bạn chưa cài đặt FaceID nào", comment: "")
            case .noFingerprintEnrolled:
                return NSLocalizedString("Bạn chưa cài đặt vân tây nào", comment: "")
            case .biometricError:
                return NSLocalizedString("Không nhận dạng được khuôn mặt hoặc vân tay", comment: "Hãy thử lại")
            case .credentialsNotSaved:
                return NSLocalizedString("Chưa lưu thông tin đăng nhập, bạn có muốn lưu vào lần đăng nhập tiếp theo không?", comment: "")
            case .noOpticIdEnrolled:
                return NSLocalizedString("Bạn chưa cài đặt OpticID", comment: "")
            }
        }
    }
    //Option to choose whether to set credentials to keychain 
    @Published var storeCredentialsNext = false 
    //Specify authentication Error
    @Published var error: AuthenticationError?
    ///isValidated is used to login after entering right credential
    @Published var isValidated: Bool = false
    ///isFailedLoggedIn to trigger alert when login with wrong credentials
    @Published var isFailedLoggedIn: Bool = false
    /// isAuthenticated var checks if there is already a user but not logged in yet
    
    @Published var isBiometricallyAuthenticated: Bool = false
    @Published var isAuthenticated: Bool = false
    @Published var currentUser: fetchUserResponse?
    
    init(){
//                logout()
        let defaults = UserDefaults.standard
        
        let token = defaults.object(forKey: "jsonwebtoken")
        if token != nil {
            isAuthenticated = true
            if let userId = defaults.object(forKey: "userid") {
                fetchUser(userId: userId as! String)
                print("User fetched")
            }
        }else{
            isAuthenticated = false
        }
    }
    static let shared = AuthViewModel()
    func register(firstname: String,lastname: String, email: String,mobile: String, password: String) {
        
        let defaults = UserDefaults.standard
        AuthServices.requestDomain =  "https://universityadmission.onrender.com/api/v1/auth/register"
        AuthServices.register(email:email, firstname: firstname, lastname: lastname, mobile: mobile, password: password, role: "user") { res in
            switch res {
            case .success(let data):
                print(data!)
                guard let user = try? JSONDecoder().decode(UserRegisterResponse.self, from: data as! Data) else {
                    print("Decoding error in register")
                    return
                }
                DispatchQueue.main.async {
                    defaults.setValue(user._id, forKey: "userid")
                    self.isAuthenticated = true
                    self.isValidated = true
                    self.login(email: user.email, password: password)
                    self.fetchUser(userId: user._id)
                }
            case .failure(let error):
                print(error.localizedDescription)
                
                
            }
        }
    }
    
    func login(email: String, password: String){
        let defaults = UserDefaults.standard
        AuthServices.requestDomain =  "https://universityadmission.onrender.com/api/v1/auth/login"
        AuthServices.login(email: email, password: password) { res in
            switch res{
            case .success(let data):
                guard let user = try? JSONDecoder().decode(UserLoginResponse.self, from: data as! Data) else {
                    print("Error decoding object when logging in")
                    self.error = .invalidCredentials
                    return
                }
                DispatchQueue.main.async {
                    if self.storeCredentialsNext {
                        if KeychainStorage.saveCredentials(Credentials(password: password)){
                            self.storeCredentialsNext = false 
                        }
                    }
                    defaults.setValue(user.token, forKey: "jsonwebtoken")
                    defaults.setValue(user._id, forKey: "userid")
                    self.isValidated = true
                    self.isAuthenticated = true
                    print(self.isValidated)
                    print(self.isAuthenticated)
                    
                }
                self.fetchUser(userId: user._id)
            case .failure(let error):
                print(error.localizedDescription)
                self.isFailedLoggedIn = true
            }
        }
    }
    func fetchUser(userId: String){
        print(userId)
        let defaults = UserDefaults.standard
        AuthServices.requestDomain = "https://universityadmission.onrender.com/api/v1/auth/user/\(userId)"
        AuthServices.fetchUser(id: userId) { res in
            switch res{
            case .success(let data):
                guard let user = try? JSONDecoder().decode(fetchUserResponse.self, from: data as! Data) else {
                    print("error decoding object")
                    return
                }
                print(user)
                DispatchQueue.main.async {
                    defaults.setValue(user.refreshToken, forKey: "jsonwebtoken")
                    defaults.setValue(user._id, forKey: "userid")
                    self.isAuthenticated = true
                    self.currentUser = user
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    func logout() {
        let defaults = UserDefaults.standard
        let dictionary = defaults.dictionaryRepresentation()
        
        dictionary.keys.forEach
        { key in   defaults.removeObject(forKey: key)
        }
        
        DispatchQueue.main.async {
            self.isAuthenticated = false
            self.isValidated = false
            self.currentUser = nil
        }
    }
    
    func BiometricType() -> BiometricType {
        let authContext = LAContext()
        let _ = authContext.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: nil)
        switch authContext.biometryType {
        case .none:
            return .none
        case .touchID:
            return .touch
        case .faceID:
            return .face
        case .opticID:
            return .optic
        @unknown default:
            return .none
        }
    }
    func requestBiometricUnlock(completion: @escaping (Result<String, AuthenticationError>) -> Void) {
//        let credentials: Credentials? = Credentials(password: password)
        let credentials = KeychainStorage.getCredentials()
        guard let credentials = credentials else {
            completion(.failure(.credentialsNotSaved))
            return
        }
        let context = LAContext()
        var error: NSError?
        let canEvaluate = context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error)
        if let error = error {
            switch error.code {
            case -6:
                completion(.failure(.deniedAccess))
            case -7:
                if context.biometryType == .faceID {
                    completion(.failure(.noFaceIDEnrolled))
                } else if context.biometryType == .opticID {
                    completion(.failure(.noOpticIdEnrolled))
                } else {
                    completion(.failure(.noFingerprintEnrolled))
                }
            default:
                completion(.failure(.biometricError))
            }
            return
        }
        if canEvaluate {
            if context.biometryType != .none {
                context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: "Need to access credentials.") { success, error in
                    DispatchQueue.main.async {
                        if error != nil {
                            completion(.failure(.biometricError))
                        } else {
                            completion(.success(credentials))
                        }
                    }
                }
            }
        }
    }
}
