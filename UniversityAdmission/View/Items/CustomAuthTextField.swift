//
//  CustomAuthTextField.swift
//  UniversityAdmission
//
//  Created by Duy Huỳnh Nguyễn Tuấn on 13/03/2024.
//

import SwiftUI

struct CustomAuthTextField: View {
    var placeholder: String
    @Binding var text: String
    var body: some View {
        VStack{
            ZStack(alignment: .leading){
//                if text.isEmpty {
//                    Text(placeholder)
//                        .foregroundColor(.gray)
//                }
                TextField("", text: $text)
                    .placeholder(when:text.isEmpty){
                        Text(placeholder)
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
//    CustomAuthTextField()
//}
