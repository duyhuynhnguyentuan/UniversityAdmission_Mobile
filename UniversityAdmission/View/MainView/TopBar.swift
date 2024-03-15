//
//  TopBar.swift
//  UniversityAdmission
//
//  Created by Duy Huỳnh Nguyễn Tuấn on 24/02/2024.
//

import SwiftUI

struct TopBar: View {
    var body: some View {
        VStack{
            ZStack{
                
                Text("UniSeeker.")
                    .foregroundStyle(.purple)
                    .fontDesign(.rounded)
                    .fontWeight(.bold)
                    .font(.system(size: 30))
                HStack{
                    Spacer()
                    Circle()
                        .frame(width: 40 , height: 40)
                        .cornerRadius(75)
                        .foregroundColor(Color(red: 152/255, green: 163/255, blue: 16/255))
                        .overlay(
                            Text("D")
                                .foregroundColor(.white)
                                .font(.system(size: 25))
                        )}.padding(.horizontal)
            }
       
        }
    }
}

#Preview {
    TopBar()
}
