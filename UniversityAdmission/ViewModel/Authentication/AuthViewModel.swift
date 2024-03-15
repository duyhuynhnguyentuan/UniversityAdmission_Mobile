//
//  AuthViewModel.swift
//  UniversityAdmission
//
//  Created by Duy Huỳnh Nguyễn Tuấn on 13/03/2024.
//

import Foundation
import SwiftUI

class AuthViewModel: ObservableObject {
    ///isValidated is used to login after entering right credential
    @Published var isValidated: Bool = false
    ///isFailedLoggedIn to trigger alert when login with wrong credentials
    @Published var isFailedLoggedIn: Bool = false
    /// isAuthenticated var checks if there is already a user but not logged in yet
  
    @Published var isBiometricallyAuthenticated: Bool = false
    @Published var isAuthenticated: Bool = false
    @Published var currentUser: User?
    
    init(){
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
        
        AuthServices.register(email:email, firstname: firstname, lastname: lastname, mobile: mobile, password: password, role: "user") { res in
            switch res {
                case .success(let data):
                    guard let user = try? JSONDecoder().decode(UserApiResponse.self, from: data as! Data) else {
                        print("Decoding error in register")
                        return
                    }
                    DispatchQueue.main.async {
                        defaults.setValue(user.token, forKey: "jsonwebtoken")
                        defaults.setValue(user.user.id, forKey: "userid")
                        self.isAuthenticated = true
                        self.fetchUser(userId: user.user._id)
                        self.isValidated = true
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
                guard let user = try? JSONDecoder().decode(UserApiResponse.self, from: data as! Data) else {
                    print("Error decoding object when logging in")
                    return
                }
                DispatchQueue.main.async {
                    defaults.setValue(user.token, forKey: "jsonwebtoken")
                    defaults.setValue(user.user.id, forKey: "userid")
                    self.isValidated = true
                    self.isAuthenticated = true
                    self.fetchUser(userId: user.user._id)
                }
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
                guard let user = try? JSONDecoder().decode(UserApiResponse.self, from: data as! Data) else {
                    print("error decoding object")
                    return
                }
                DispatchQueue.main.async {
                    defaults.setValue(user.refreshToken, forKey: "jsonwebtoken")
                    defaults.setValue(user.user.id, forKey: "userid")
                    self.isAuthenticated = true
                    self.currentUser = user.user
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

}
