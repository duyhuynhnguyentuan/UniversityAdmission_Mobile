//
//  AlreadyLoggedInView.swift
//  UniversityAdmission
//
//  Created by Duy Huỳnh Nguyễn Tuấn on 14/03/2024.
//

import SwiftUI

struct AlreadyLoggedInView: View {
    @State private var password = ""
    @StateObject private var viewModel = AuthViewModel.shared

    var body: some View {
        NavigationView {
            VStack {
                Image("Logo")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 90, height: 90)
                VStack {
                    Text("Xin chào,")
                        .font(.system(size: 25))
                        .fontWeight(.light)
                    Text("\(viewModel.currentUser?.firstname ?? "") \(viewModel.currentUser?.lastname ?? "")")
                        .font(.system(size: 50))
                        .bold()
                        .foregroundColor(.purple)
                }
                .padding(.top, 50)
                HStack {
                    SecureField("Mật khẩu", text: $password)
                    if viewModel.BiometricType() != .none {
                        Button{
                            viewModel.requestBiometricUnlock(){ (result:Result<String, AuthViewModel.AuthenticationError>) in
                                switch result{
                                case .success(let credentials):
                                    viewModel.login(email: viewModel.currentUser?.email ?? "", password: credentials)
                                case .failure(let error):
                                    viewModel.error = error
                                }
                            }
                        }label: {
                            if viewModel.BiometricType() == .face {
                                Image(systemName: "faceid")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 40, height: 40)
                                    .foregroundColor(.purple)
                            }else if viewModel.BiometricType() == .touch {
                                //if the target devices system software version above 17.0 then this is not needed
                                Image(systemName: "touchid")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 40, height: 40)
                                    .foregroundColor(.purple)
                            }else{
                                Image(systemName: "opticid")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 40, height: 40)
                                    .foregroundColor(.purple)
                            }
                        }
                    }
                }
                .padding(.horizontal)
                Button(action: {
                    viewModel.login(email: viewModel.currentUser?.email ?? "", password: password)
                }) {
                    Capsule()
                        .frame(width: UIScreen.main.bounds.width * 0.9, height: 50)
                        .foregroundColor(.purple)
                        .overlay(
                            Text("Đăng nhập")
                                .foregroundColor(.white)
                                .bold()
                        )
                }
                .padding(.top, 30)
                HStack {
                    Spacer()
                    NavigationLink(destination: WelcomeView().navigationBarBackButtonHidden()) {
                        Text("Đăng nhập tài khoản khác")
                            .font(.system(size: 15))
                            .bold()
                            .underline()
                            .foregroundColor(.purple)
                    }
                }
                .padding(.horizontal, UIScreen.main.bounds.width * 0.1)
                .padding(.top)
                Spacer()
            }
        }
        .onAppear {
            if let currentUser = viewModel.currentUser {
                password = ""
                print("Current user: \(currentUser)")
            } else {
                print("Current user is nil")
            }
        }
        .alert(item: $viewModel.error) { error in
                    if error == .credentialsNotSaved {
                        return Alert(title: Text("Chưa lưu thông tin đăng nhập"),
                                     message: Text(error.localizedDescription),
                                     primaryButton: .default(Text("OK"), action: {
                                        viewModel.storeCredentialsNext = true
                                     }),
                                     secondaryButton: .cancel())
                    } else {
                        return Alert(title: Text("Không hợp lệ"), message: Text(error.localizedDescription))
                    }
                }
//        .alert(
//                   Text("Thông tin đăng nhập chưa chính xác!"),
//                   isPresented: $viewModel.isFailedLoggedIn
//               ) {
//                   Button("Tôi đã hiểu.", role: .cancel) {
//                       // Handle the acknowledgement.
//                   }
//               } message: {
//                  Text("Hãy kiểm tra lại thông tin đăng nhập")
//               }

    }
}
#Preview {
    AlreadyLoggedInView()
}
