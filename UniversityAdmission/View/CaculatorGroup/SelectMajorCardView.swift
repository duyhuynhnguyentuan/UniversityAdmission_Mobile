//
//  SelectMajorCardView.swift
//  UniversityAdmission
//
//  Created by Duy Huỳnh Nguyễn Tuấn on 22/03/2024.
//

import SwiftUI

struct SelectMajorCardView: View {
    var major : Major
    var body: some View {
            HStack {
                VStack(alignment: .leading) {
                    Text(major.name)
                        .font(.system(size: 18))
                        .fontWeight(.bold)
                        .multilineTextAlignment(.leading)
                    
                    // Abbreviation with bold "code" style
                    Text("Mã ngành: ")
                        .fontWeight(.light)
                    + Text(major.code)
                        .fontWeight(.bold)
                    
                    Text("Có hiệu lực từ: ")
                        .fontWeight(.light)
                    +  Text(String(major.effectiveDate))
                }
                .fontDesign(.rounded)
                Spacer()
                Image(systemName: "chevron.right")
            }
            .padding(.all, 20)
    //        .padding(.horizontal)
            .overlay(
                RoundedRectangle(cornerRadius: 25.0)
                    .stroke(LinearGradient(
                        colors: [.purple, .indigo],
                        startPoint: .top,
                        endPoint: .bottom
                    ), lineWidth: 4)
                   
            )
        }
    }


//#Preview {
//    SelectMajorCardView()
//}
