//
//  SearchView.swift
//  UniversityAdmission
//
//  Created by Duy Huỳnh Nguyễn Tuấn on 24/02/2024.
//

import SwiftUI

struct UniversitySearchView: View {
    @State private var searchTerm = ""
    @State var isPresentedDetail = false
    @StateObject var viewModel = UniversitySearchViewModel()
    @State var selectedUniversity: University? = nil
    //vibration
    func simpleSuccess(){
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(.warning)
    }
    var body: some View {
        NavigationSplitView(sidebar: {
                List(selection: $selectedUniversity){
                    ForEach(viewModel.filteredUniversities){ uni in
                        UniversitySearchCardView(university: uni)
                            .tag("Trường đại học")
                            .onTapGesture {
                                self.selectedUniversity = uni
                                simpleSuccess()
                            }
                    }
                    .listRowSeparator(.hidden, edges: .all)
                }.listStyle(.plain)
            .opacity(viewModel.isLoading ? 0 : 1)
            .overlay(
                ProgressView().opacity(viewModel.isLoading ? 1 : 0 )
                    .scaleEffect(3.0)
            )
            .navigationTitle("Tìm kiếm")
        }, detail: {
            if let university = selectedUniversity{
                    UniSearchDetailView(University: university)
                    .navigationBarTitleDisplayMode(.inline)
                    .navigationTitle("Chi tiết")
                  
                    
            }else{
                Image(systemName: "graduationcap.circle.fill")
                                    .resizable()
                                    .frame(width: 45, height: 45)
                                VStack{
                
                                }
                                Text("Tìm kiếm một trường đại học")
                
                                    .font(.system(size: 25).weight(.bold))
                
                                Text("Hay bắt đầu tìm kiếm trêm thanh tìm kiếm để tìm các trường đại học")
                                    .multilineTextAlignment(.center)
            }
        })
        .searchable(text: $viewModel.searchText)
        .searchScopes($viewModel.searchScope, scopes:{
            Text("All").tag(UniversitySearchScope.all)
            ForEach(UniversityProvince.allCases) { province in
                Text(province.rawValue).tag(UniversitySearchScope.province(province))
            }
            
        }
        )
        
    }
}

#Preview {
    UniversitySearchView()
}
