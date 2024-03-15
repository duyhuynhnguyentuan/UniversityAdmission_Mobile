//
//  ContentView.swift
//  UniversityAdmission
//
//  Created by Duy Huỳnh Nguyễn Tuấn on 24/02/2024.
//

import SwiftUI

struct ContentView: View {
    init(){
      
    }
    var body: some View {
        TabView{
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house.fill")
                }
            SearchView()
//                .badge("!")
                .tabItem {
                Label("Search", systemImage: "magnifyingglass.circle")
            }
        }
        .accentColor(.purple)
    }
}

#Preview {
    ContentView()
}
