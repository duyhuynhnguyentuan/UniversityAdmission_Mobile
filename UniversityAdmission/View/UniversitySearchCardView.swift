//
//  UniversitySearchCardView.swift
//  UniversityAdmission
//
//  Created by Duy Huỳnh Nguyễn Tuấn on 03/03/2024.
//

import SwiftUI

struct UniversitySearchCardView: View {
    var university : University
//    var schoolName: String
//    var abbreviation: String
//    var yearEstablished: Int
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(university.name)
                    .font(.system(size: 18))
                    .fontWeight(.bold)
                    .multilineTextAlignment(.leading)
                
                // Abbreviation with bold "code" style
                Text("Viết tắt: ")
                    .fontWeight(.light)
                + Text(university.abbreviation)
                    .fontWeight(.bold)
                
                Text("Ngày thành lập: ")
                    .fontWeight(.light)
                +  Text(String(university.yearEstablish))
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

struct UniversitySearchCardView_Previews: PreviewProvider {
    static var previews: some View {
        UniversitySearchView()
    }
}
