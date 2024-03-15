//
//  MajorSearchViewModel.swift
//  UniversityAdmission
//
//  Created by Duy Huỳnh Nguyễn Tuấn on 06/03/2024.
//

import Foundation

class MajorSearchViewModel: ObservableObject{
    @Published var major = [Major]()
    init(){
       getMajors()
    }
    func getMajors(){
        MajorService.requestDomain = "https://universityadmission.onrender.com/api/v1/major"
        MajorService.getMajor{ result in
            switch result {
            case .success(let data):
                do {
                    let majors = try JSONDecoder().decode([Major].self, from: data)
                    DispatchQueue.main.async {
                        self.major = majors
                    }
                } catch {
                    print("Error decoding JSON: \(error)")
                    // Handle decoding error
                }

            case .failure(let error):
                print("Network Error: \(error.localizedDescription)")
                // Handle network error
            }
        }
    }
}
