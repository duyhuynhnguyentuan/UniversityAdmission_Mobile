//
//  RegisterView.swift
//  UniversityAdmission
//
//  Created by Duy Huỳnh Nguyễn Tuấn on 13/03/2024.
//

import SwiftUI

struct RegisterView: View {
    @State var firstname = ""
    @State var lastname = ""
    @State var email = ""
    @State var mobile = ""
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
            Text("Tạo tài khoản mới")
                .font(.title)
                .bold()
                .foregroundStyle(.purple)
                .padding(.top, 10)
            VStack(alignment: .leading, spacing: nil, content: {
                CustomAuthTextField(placeholder: "Firstname", text: $firstname)
                CustomAuthTextField(placeholder: "Lastname", text: $lastname)
               CustomNumberField(placeholder: "Phone Number", mobile: $mobile)
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
                        self.viewModel.register(firstname: firstname, lastname: lastname, email: email, mobile: mobile, password: password)
                    }, label: {
                        Capsule()
                            .frame(width: 60, height: 30, alignment: .center)
                            .foregroundColor(.purple)
                            .overlay(
                                Text("Next")
                                    .foregroundColor(.white)
                            )
                    })
                }
                .padding(.trailing, 24)
            }
        }
    }
}

#Preview {
    RegisterView()
}
