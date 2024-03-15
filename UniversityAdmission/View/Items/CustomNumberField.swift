//
//  CustomNumberField.swift
//  UniversityAdmission
//
//  Created by Duy Huỳnh Nguyễn Tuấn on 14/03/2024.
//

import SwiftUI

struct CustomNumberField: View {
    var placeholder: String
    @Binding var mobile: String
    var body: some View {
        VStack{
            ZStack(alignment: .leading){
                TextField("", text: $mobile)
                    .keyboardType(.numberPad)
                    .placeholder(when:mobile.isEmpty){
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
//    CustomNumberField()
//}
