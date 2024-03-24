//
//  TopBar.swift
//  UniversityAdmission
//
//  Created by Duy Huỳnh Nguyễn Tuấn on 24/02/2024.
//

import SwiftUI

struct TopBar: View {
    @StateObject private var viewmodel = AuthViewModel.shared
    var showLogo: Bool
    var body: some View {
        
            VStack{
                ZStack{
                    
                    Text("UniSeeker.")
                        .foregroundStyle(.purple)
                        .fontDesign(.rounded)
                        .fontWeight(.bold)
                        .font(.system(size: 30))
                        .opacity(showLogo ? 1 : 0)
                    HStack{
                        Spacer()
                        NavigationLink(destination: EditProfileView(viewmodel: viewmodel).navigationBarBackButtonHidden()){
                            Circle()
                                .frame(width: 50 , height: 50)
                                .cornerRadius(75)
                                .foregroundColor(Color(red: 152/255, green: 163/255, blue: 16/255))
                                .overlay(
                                    Text("\(viewmodel.currentUser?.firstname.prefix(1).uppercased() ?? "")\(viewmodel.currentUser?.lastname.prefix(1).uppercased() ?? "")")
                                        .foregroundColor(.white)
                                        .font(.system(size: 22))
                                )
                        }
                    }.padding(.horizontal)
                }
                
            }
        
    }
}
#Preview {
    TopBar(showLogo: true)
}
