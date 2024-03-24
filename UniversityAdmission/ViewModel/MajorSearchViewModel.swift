//
//  MajorSearchViewModel.swift
//  UniversityAdmission
//
//  Created by Duy Huỳnh Nguyễn Tuấn on 06/03/2024.
//

import Foundation

class MajorSearchViewModel: ObservableObject{
    @Published var majors = [Major]()
    @Published var isLoading = true
    @Published var searchText: String = ""
    init(){
       getMajors()
    }
    static let shared = MajorSearchViewModel()
    func getMajors(){
        MajorService.requestDomain = "https://universityadmission.onrender.com/api/v1/major"
        MajorService.getMajor{ result in
            switch result {
            case .success(let data):
                do {
                    let majors = try JSONDecoder().decode([Major].self, from: data)
                    DispatchQueue.main.async {
                        self.majors = majors
                        self.isLoading = false
                    }
                } catch {
                    print("Error decoding JSON ingetMajors(): \(error)")
                    // Handle decoding error
                }

            case .failure(let error):
                print("Network Error: \(error.localizedDescription)")
                // Handle network error
            }
        }
    }
    var filteredMajors: [Major] {
           var majors = self.majors

           if searchText.count > 0 {
               majors = majors.filter { $0.name.localizedCaseInsensitiveContains(searchText) }
           }

           return majors
       }
}
