//
//  SearchView.swift
//  UniversityAdmission
//
//  Created by Duy Huỳnh Nguyễn Tuấn on 24/02/2024.
//

import SwiftUI

struct SearchView: View {
    @State private var searchTerm = ""
    var body: some View {
        NavigationView{
            VStack{
                Image(systemName: "graduationcap.circle.fill")
                    .resizable()
                    .frame(width: 45, height: 45)
                Text("Tìm kiếm một trường đại học")
                
                    .font(.system(size: 25).weight(.bold))
                    
                Text("Hay bắt đầu tìm kiếm trêm thanh tìm kiếm để tìm các trường đại học")
                    .multilineTextAlignment(.center)
            }
            .padding()
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity)
            .foregroundColor(.gray)
            .navigationTitle("Tìm kiếm")
        }.searchable(text: $searchTerm)
    }
}

#Preview {
    SearchView()
}
