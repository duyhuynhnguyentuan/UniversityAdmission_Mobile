//
//  SelectMajorView.swift
//  UniversityAdmission
//
//  Created by Duy Huỳnh Nguyễn Tuấn on 22/03/2024.
//

import SwiftUI

struct SelectMajorView: View {
    @Binding var selectedMajor: Major
    @StateObject var viewModel = MajorSearchViewModel()
    @Environment(\.dismiss) var dismiss
    func simpleSuccess(){
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(.warning)
    }
    var body: some View {
        NavigationSplitView(sidebar: {
            List(){
                    ForEach(viewModel.filteredMajors){ major in
                        SelectMajorCardView(major: major)
                            .tag("Ngành đại học")
                            .onTapGesture {
                                self.selectedMajor = major
                                dismiss()
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
                Image(systemName: "graduationcap.circle.fill")
                                    .resizable()
                                    .frame(width: 45, height: 45)
                                VStack{
                
                                }
                                Text("Tìm kiếm một ngành học")
                
                                    .font(.system(size: 25).weight(.bold))
                
                                Text("Hay bắt đầu tìm kiếm trêm thanh tìm kiếm để tìm các ngành học")
                                    .multilineTextAlignment(.center)
            
        })
        .searchable(text: $viewModel.searchText)
    }
}

//#Preview {
//    SelectMajorView()
//}
