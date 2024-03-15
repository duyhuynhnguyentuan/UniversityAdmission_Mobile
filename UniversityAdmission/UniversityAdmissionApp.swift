//
//  UniversityAdmissionApp.swift
//  UniversityAdmission
//
//  Created by Duy Huỳnh Nguyễn Tuấn on 24/02/2024.
//

import SwiftUI

@main
struct UniversityAdmissionApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(AuthViewModel.shared)
//            WelcomeView()
        }
    }
}
