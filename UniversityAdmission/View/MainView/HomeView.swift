//
//  HomeView.swift
//  UniversityAdmission
//
//  Created by Duy Huỳnh Nguyễn Tuấn on 24/02/2024.
//

import SwiftUI
import SplineRuntime

struct HomeView: View {
    
    @State private var remainingDays = 0
    let dateComponents = DateComponents(calendar: Calendar.current, year: 2024, month: 6, day: 27)
    
    var body: some View {

        NavigationView { // Wrap only the content that needs navigation functionality
            VStack {
                ZStack(alignment: .topLeading) {
                   Onboard3DView()
                        .frame(height: 500)
                        .ignoresSafeArea()
                    // Assuming TopBar is some custom view you have
                    TopBar(showLogo: false)
                }
                VStack(spacing: 12) {
                    Text("Còn \(remainingDays) ngày nữa là thi đại học")
                        .font(.system(size: 20))
                        .fontWeight(.bold)
                        .fontDesign(.default)
                    Text("Hãy cùng UniSeeker cập nhật những thông tin đại học mới nhất nhé. ")
                        .foregroundStyle(.secondary)
                }
                .padding(.horizontal)
                Spacer()
                
            }
            .onAppear {
                updateRemainingDays()
            }
            .navigationTitle("") // Hide the navigation title
            .navigationBarHidden(true) // Hide the navigation bar
        }
    }

    func updateRemainingDays() {
        guard let composedDate = Calendar.current.date(from: dateComponents)
        else {
            return
        }

        let calendar = Calendar.current
        let timeInterval = calendar.dateComponents([.day], from: Date(), to: composedDate)

        if let daysSince = timeInterval.day {
            self.remainingDays = max(0, daysSince)
        } else {
            self.remainingDays = 0
        }
    }
}

#Preview {
    HomeView()
}



struct Onboard3DView: View {
    var body: some View {
        // fetching from cloud
        let url = URL(string: "https://build.spline.design/SmTmAgnIl1pXckMRZG-G/scene.splineswift")!
//        let url = URL(string: "https://build.spline.design/NxIME2Z6siOEk7brDrNg/scene.splineswift")!
        
        // // fetching from local
        // let url = Bundle.main.url(forResource: "scene", withExtension: "splineswift")!

        try? SplineView(sceneFileURL: url)
    }
}








