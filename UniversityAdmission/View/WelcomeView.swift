//
//  WelcomeView.swift
//  UniversityAdmission
//
//  Created by Duy Huỳnh Nguyễn Tuấn on 13/03/2024.
//

import SwiftUI

struct WelcomeView: View {
    @Environment(\.colorScheme) var colorScheme
    var body: some View {
            NavigationView{
                VStack{
                    HStack{
                        Spacer()
                        Image("Logo")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 100, height: 90)
                        Spacer()
                    }
                    Spacer()
                    Text("Hãy cùng đến với những thông tin về đại học.")
                        .font(.system(size: 30, weight: .heavy, design: .default))
                        .frame(width: getRect().width * 0.9,alignment: .center)
                    Spacer()
                    VStack(spacing: 10){
                        Button{
                           print("google signin")
                        }label: {
                            HStack(spacing: -4){
                                Image("google")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 25, height: 25)
                                Text("Continue with Google")
                                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                    .font(.title3)
                                    .foregroundColor(colorScheme == .dark ? Color.white : Color.black)
                                    .padding()
                            }
                            .overlay(
                            RoundedRectangle(cornerRadius: 36)
                                .stroke(colorScheme == .dark ? Color.white : Color.black, lineWidth: /*@START_MENU_TOKEN@*/1.0/*@END_MENU_TOKEN@*/)
                                .opacity(0.3)
                                .frame(width: 320, height: 60, alignment: .center)
                            )
                        }
                        Button{
                            
                        }label: {
                            HStack(spacing: -4){
                                Image("apple")
                                    .renderingMode(.template)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 25, height: 25)
                                    .foregroundColor(colorScheme == .dark ? .white : .black)
                                Text("Continue with Apple")
                                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                    .font(.title3)
                                    .foregroundColor(colorScheme == .dark ? Color.white : Color.black)
                                    .padding()
                            }
                            .overlay(
                            RoundedRectangle(cornerRadius: 36)
                                .stroke(colorScheme == .dark ? Color.white : Color.black, lineWidth: /*@START_MENU_TOKEN@*/1.0/*@END_MENU_TOKEN@*/)
                                .opacity(0.3)
                                .frame(width: 320, height: 60, alignment: .center)
                            )
                        }
                        HStack{
                            Rectangle()
                                .foregroundColor(.gray)
                                .opacity(0.3)
                                .frame(width: getRect().width * 0.35, height: 1)
                            Text("Or")
                                .foregroundColor(.gray)
                            Rectangle()
                                .foregroundColor(.gray)
                                .opacity(0.3)
                                .frame(width: getRect().width * 0.35, height: 1)
                        }
                        NavigationLink(destination: RegisterView().navigationBarHidden(true)){
                            RoundedRectangle(cornerRadius: 36)
                                .foregroundColor(Color("bg"))
                                .frame(width: 320, height: 60, alignment: .center)
                                .overlay(
                                Text("Create account")
                                    .fontWeight(.bold)
                                    .font(.title3)
                                    .foregroundColor(.white)
                                    .padding()
                                )
                        }
                    }
                    .padding()
                    VStack(alignment: .leading){
                        VStack{
                            Text("By proceeding, you agree to our ")
                            +
                            Text("Term")
                                .foregroundColor(Color("bg"))
                            +
                            Text(",")
                            +
                            Text("Privacy Policy")
                                .foregroundColor(Color("bg"))
                            +
                            Text(", and ")
                            +
                            Text("Cookie Use")
                                .foregroundStyle(Color("bg"))
                        }.padding(.bottom)
                        HStack(spacing: 2){
                            Text("Have an account already?")
                            NavigationLink(destination: LogInView().navigationBarBackButtonHidden()){
                                Text("Log in")
                                    .foregroundColor(Color("bg"))
                            }
                        }
                    }
                }.navigationTitle("")
                .navigationBarHidden(true)
            }
        }
    }

#Preview {
    WelcomeView()
}
