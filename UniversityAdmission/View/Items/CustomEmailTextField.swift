//
//  CustomEmailTextField.swift
//  UniversityAdmission
//
//  Created by Duy Huỳnh Nguyễn Tuấn on 14/03/2024.
//

import SwiftUI

struct CustomEmailTextField: View {
    var placeholder: String
    @Binding var email : String
    var body: some View {
        VStack{
            ZStack(alignment: .leading){
                TextField("", text: $email)
                    .placeholder(when:email.isEmpty){
                        Text(placeholder)
                            .keyboardType(.emailAddress)
                            .foregroundStyle(
                                .linearGradient(
                                    colors: [.purple, .indigo], startPoint: .leading,
                                    endPoint: .trailing
                                )
                            )
                            .opacity(0.7)
                    }
                    .frame(height: 45)
                    .foregroundColor(.purple)
            }
            Rectangle()
                .frame(height: 1, alignment: .center)
                .foregroundColor(.gray)
                .padding(.top, -2)
        }
        .padding(.horizontal)
    }
}

//#Preview {
//    CustomEmailTextField()
//}
