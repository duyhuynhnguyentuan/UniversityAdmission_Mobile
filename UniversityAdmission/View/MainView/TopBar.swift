//
//  TopBar.swift
//  UniversityAdmission
//
//  Created by Duy Huỳnh Nguyễn Tuấn on 24/02/2024.
//

import SwiftUI

struct TopBar: View {
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
                    Circle()
                        .frame(width: 50 , height: 50)
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
    TopBar(showLogo: true)
}
