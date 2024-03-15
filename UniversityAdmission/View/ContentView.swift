//
//  ContentView.swift
//  UniversityAdmission
//
//  Created by Duy Huỳnh Nguyễn Tuấn on 24/02/2024.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    var body: some View {
        if viewModel.isValidated{
            TabView{
                HomeView()
                    .tabItem {
                        Label("Trang chủ", systemImage: "house.fill")
                    }
                UniversitySearchView()
    //                .badge("!")
                    .tabItem {
                    Label("Tìm kiếm", systemImage: "magnifyingglass.circle")
                }
                CaculatorView()
                    .tabItem {
                        Label("Tính điểm", systemImage: "plus.forwardslash.minus")
                    }
            }
            .accentColor(.purple)
        }else{
            if viewModel.isAuthenticated {
                AlreadyLoggedInView().environmentObject(viewModel)
            }else{
                WelcomeView()
            }
        }
     
    }
}

#Preview {
    ContentView()
}
