//
//  AlreadyLoggedInView.swift
//  UniversityAdmission
//
//  Created by Duy Huỳnh Nguyễn Tuấn on 14/03/2024.
//

import SwiftUI

struct AlreadyLoggedInView: View {
    @State var password = ""
    @EnvironmentObject var viewModel: AuthViewModel
    var body: some View {
        NavigationView{
            VStack{
                HStack{
                    Image("Logo")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 90 , height: 90)
                }
                VStack{
                    Text("Xin chào,")
                        .font(.system(size: 25))
                        .fontWeight(.light)
                    Text("\(self.viewModel.currentUser!.firstname) \(self.viewModel.currentUser!.lastname)")
                        .font(.system(size: 50))
                        .bold()
                    
                }.padding(.top, 50)
                    .foregroundStyle(.purple)
                HStack{
                    SecureAuthTextField(placeholder: "Mật khẩu", text: $password )
                    Image(systemName: "faceid")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 40, height: 40)
                        .foregroundStyle(.purple)
                }
                .padding(.horizontal)
                Button(action: {
                    self.viewModel.login(email: viewModel.currentUser!.email, password: password)
                }, label: {
                    Capsule()
                        .frame(width: UIScreen.main.bounds.width * 0.9 , height: 50, alignment: .center)
                        .foregroundColor(.purple)
                        .overlay(
                            Text("Đăng nhập")
                                .foregroundColor(.white)
                                .bold()
                        )
                })
                .padding(.top,30)
                HStack{
                    Spacer()
                    NavigationLink(destination: WelcomeView().navigationBarBackButtonHidden()){
                        Text("Đăng nhập tài khoản khác")
                            .font(.system(size: 15))
                            .bold()
                            .underline()
                            .foregroundStyle(.purple)
                    }
                }
                .padding(.horizontal, UIScreen.main.bounds.width * 0.1)
                .padding(.top)
                Spacer()
            }
        }
    }
}

#Preview {
    AlreadyLoggedInView()
}
