//
//  EditProfileView.swift
//  UniversityAdmission
//
//  Created by Duy Huỳnh Nguyễn Tuấn on 16/03/2024.
//

import SwiftUI

struct EditProfileView: View {
    @State var firstName: String = ""
    @State var lastName: String = ""
//    let currentUser: fetchUserResponse
    @Environment(\.dismiss) var dismiss
    @StateObject var viewmodel: AuthViewModel
    var body: some View {
        VStack{
            ZStack{
                HStack{
                    Button{
                        dismiss()
                    }label: {
                        Image(systemName: "arrow.left")
                            .foregroundColor(.purple)
                            .font(.system(size: 30))
                    }
                    
                    Spacer()
                    Button{
                        
                    }label: {
                        Text("Save")
                            .foregroundStyle(.purple)
                            .font(.system(size: 20))
                    }
                }
                .padding(.horizontal)
                Image("Logo")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 60 , height: 60)
            }
            Circle()
                .frame(width: 80 , height: 80)
                .cornerRadius(75)
                .foregroundColor(Color(red: 152/255, green: 163/255, blue: 16/255))
                .overlay(
                    //                    Text("\(viewmodel.currentUser!.firstname.prefix(1).uppercased())\(viewmodel.currentUser!.lastname.prefix(1).uppercased())")
                    Text("DH")
                        .foregroundColor(.white)
                        .font(.system(size: 45))
                        .bold()
                )
                .padding(.top, 10)
           
            Text("DUY HUYNH")
                .foregroundStyle(.secondary)
                .font(.system(size: 25))
                .bold()
                .padding(.vertical)
            VStack(spacing: 10){
                VStack(alignment: .leading, spacing: 20){
                    Text("Firstname")
                        .font(.system(size: 20))
                        .foregroundStyle(.secondary)
                    TextField("", text: $firstName)
                        .font(.system(size: 25))
                        .placeholder(when: firstName.isEmpty){
                            //                    Text(currentUser.firstname)
                            Text("Duy")
                               
                                .foregroundStyle(
                                    .linearGradient(
                                        colors: [.purple, .indigo], startPoint: .leading,
                                        endPoint: .trailing
                                    )
                                )
                                .opacity(0.7)
                        }
                        .padding(.horizontal)
                        .overlay(
                            RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                                .stroke(Color.secondary, lineWidth: 3)
                                .frame(height: 50)
                        )
                }
                VStack(alignment: .leading, spacing: 20){
                    Text("Lastname")
                        .font(.system(size: 20))
                        .foregroundStyle(.secondary)
                    TextField("", text: $firstName)
                        .font(.system(size: 25))
                        .placeholder(when: firstName.isEmpty){
                            //                    Text(currentUser.firstname)
                            Text("Huynh")
                                
                                .foregroundStyle(
                                    .linearGradient(
                                        colors: [.purple, .indigo], startPoint: .leading,
                                        endPoint: .trailing
                                    )
                                )
                                .opacity(0.7)
                        }
                        .padding(.horizontal)
                        .overlay(
                            RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                                .stroke(Color.secondary, lineWidth: 3)
                                .frame(height: 50)
                        )
                }
                VStack(alignment: .leading, spacing: 20){
                    Text("Email")
                        .font(.system(size: 20))
                        .foregroundStyle(.secondary)
                    TextField("", text: $firstName)
                        .font(.system(size: 25))
                        .placeholder(when: firstName.isEmpty){
                            //                    Text(currentUser.firstname)
                            Text("andyhntd2003@gmail.com")
                             
                                .foregroundStyle(
                                    .linearGradient(
                                        colors: [.purple, .indigo], startPoint: .leading,
                                        endPoint: .trailing
                                    )
                                )
                                .opacity(0.7)
                        }
                        .padding(.horizontal)
                        .overlay(
                            RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                                .stroke(Color.secondary, lineWidth: 3)
                                .frame(height: 50)
                        )
                }
                VStack(alignment: .leading, spacing: 20){
                    Text("Mobile")
                        .font(.system(size: 20))
                        .foregroundStyle(.secondary)
                    TextField("", text: $firstName)
                        .font(.system(size: 25))
                        .placeholder(when: firstName.isEmpty){
                            //                    Text(currentUser.firstname)
                            Text("0835488888")
                              
                                .foregroundStyle(
                                    .linearGradient(
                                        colors: [.purple, .indigo], startPoint: .leading,
                                        endPoint: .trailing
                                    )
                                )
                                .opacity(0.7)
                        }
                        .padding(.horizontal)
                        .overlay(
                            RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                                .stroke(Color.secondary, lineWidth: 3)
                                .frame(height: 50)
                        )
                }
                VStack(alignment: .leading, spacing: 20){
                    Text("Gender")
                        .font(.system(size: 20))
                        .foregroundStyle(.secondary)
                    TextField("", text: $firstName)
                        .font(.system(size: 25))
                        .placeholder(when: firstName.isEmpty){
                            //                    Text(currentUser.firstname)
                            Text("Male")
                               
                                .foregroundStyle(
                                    .linearGradient(
                                        colors: [.purple, .indigo], startPoint: .leading,
                                        endPoint: .trailing
                                    )
                                )
                                .opacity(0.7)
                        }
                        .padding(.horizontal)
                        .overlay(
                            RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                                .stroke(Color.secondary, lineWidth: 3)
                                .frame(height: 50)
                        )
                }
            }
            Button{
                viewmodel.logout()
                
            }label: {
                RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                    .foregroundColor(.red)
                    .opacity(9)
                    .overlay(
                    Text("Đăng xuất")
                        .foregroundStyle(.white)
                        .bold()
                    )
            }
            .padding(.top)
            //Spacer() to put everything up
            Spacer()
        }.padding(.horizontal)
          
        }
    }

//#Preview {
//    EditProfileView()
//}
