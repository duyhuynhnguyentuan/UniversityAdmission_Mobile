//
//  InfoMajorFeedView.swift
//  UniversityAdmission
//
//  Created by Duy Huỳnh Nguyễn Tuấn on 23/03/2024.
//

import SwiftUI

struct InfoMajorFeedView: View {
    @StateObject var viewModel = MajorSearchViewModel.shared
    var body: some View {
        NavigationView{
            ScrollView{
                HStack{
                    Spacer()
                    Text("Đang hiện \(viewModel.filteredMajors.count) kết quả")
                        .foregroundStyle(.gray)
                }.padding(.horizontal)
                LazyVStack(spacing: 25){
                    ForEach(viewModel.filteredMajors){ major in
                        HStack{
                            VStack(alignment: .leading){
                                Text(major.name)
                                    .font(.title)
                                    .foregroundStyle(.purple)
                                Text("Mã ngành \(major.code)")
                                    .font(.footnote)
                                Text("Ngày có hiệu lực: \(major.effectiveDate)")
                                    .font(.caption)
                                Text(major.note)
                                    .font(.callout)
                            }
                            .padding()
                            Spacer()
                        }.overlay(
                            RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                                .stroke(Color.indigo, lineWidth: 4)
                            
                            
                        )
                    }
                }.padding(.horizontal)
            }
            .navigationTitle("Thông tin ngành học")
            .navigationBarTitleDisplayMode(.inline)
        }
        .searchable(text: $viewModel.searchText)
        
        
    }
}

//#Preview {
//    InfoMajorFeedView()
//}
