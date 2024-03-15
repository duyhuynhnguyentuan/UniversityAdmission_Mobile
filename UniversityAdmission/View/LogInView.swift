//
//  LogInView.swift
//  UniversityAdmission
//
//  Created by Duy Huỳnh Nguyễn Tuấn on 13/03/2024.
//

import SwiftUI

struct LogInView: View {
    @State var email = ""
    @State var password = ""
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var viewModel : AuthViewModel
    var body: some View {
        VStack{
            ZStack{
                HStack{
                    Button{
                        dismiss()
                    }label: {
                        Text("Cancel")
                            .foregroundStyle(.purple)
                    }
                    Spacer()
                }
                Image("Logo")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 90 , height: 90)
            }.padding(.horizontal)
            Text("Đăng nhập")
                .font(.title)
                .bold()
                .foregroundStyle(.purple)
                .padding(.top, 10)
            VStack(alignment: .leading, spacing: nil, content: {
                CustomEmailTextField(placeholder: "Email", email: $email)
                SecureAuthTextField(placeholder: "Password", text: $password)

            })
            
            Spacer(minLength: 0)
            
            VStack {
                Rectangle()
                    .frame(height: 1)
                    .foregroundColor(.gray)
                
                HStack {
                    
                    Spacer()
                    
                    Button(action: {
                        self.viewModel.login(email: email, password: password)
                    }, label: {
                        Capsule()
                            .frame(width: 60, height: 30, alignment: .center)
                            .foregroundColor(.purple)
                            .overlay(
                                Text("Login")
                                    .foregroundColor(.white)
                            )
                    })
//                    .alert(
//                               Text("Thông tin đăng nhập chưa chính xác!"),
//                               isPresented: $viewModel.isFailedLoggedIn
//                           ) {
//                               Button("Tôi đã hiểu.", role: .cancel) {
//                                   // Handle the acknowledgement.
//                               }
//                           } message: {
//                              Text("Hãy kiểm tra lại thông tin đăng nhập")
//                           }
                }
                .padding(.trailing, 24)
            }
        }
    }
}

#Preview {
    LogInView()
}
