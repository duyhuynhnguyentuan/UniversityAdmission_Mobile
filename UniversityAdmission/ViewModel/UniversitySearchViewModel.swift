//
//  UniversitySearchViewModel.swift
//  UniversityAdmission
//
//  Created by Duy Huỳnh Nguyễn Tuấn on 29/02/2024.
//


import Foundation
//import Observation

enum UniversityProvince: String, Codable, CaseIterable, Hashable,Identifiable {
    var id: String { rawValue }
    case hoChiMinh = "TP Hồ Chí Minh"
    case haNoi = "Hà Nội"
    case daNang = "Đà Nẵng"
    case hue = "Huế"
    case canTho = "Cần Thơ"
}
enum UniversitySearchScope: Hashable {
    case all
    case province(UniversityProvince)
}


class UniversitySearchViewModel: ObservableObject {
    @Published var universities = [University]()
    @Published var isLoading = true
    @Published var searchText: String = ""
    @Published var searchScope: UniversitySearchScope = .all

    init() {
        fetchUniversities()
        searchScope = .all
    }

    func fetchUniversities() {
        UniversityService.requestDomain = "https://universityadmission.onrender.com/api/v1/university"
        UniversityService.getUniversity { result in
            switch result {
            case .success(let data):
                do {
                    let universities = try JSONDecoder().decode([University].self, from: data)
                    DispatchQueue.main.async {
                        self.universities = universities
                        self.isLoading = false
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
    var filteredUniversities: [University] {
           var universities = self.universities

           switch searchScope {
           case .all:
               break
           case .province(let province):
               let provinceSearchPredicate = #Predicate<University> { university in
                   return university.province?.contains { $0.province == province.rawValue } ?? false
               }
               universities = try! universities.filter(provinceSearchPredicate)
           }

           if searchText.count > 0 {
               universities = universities.filter { $0.name.localizedCaseInsensitiveContains(searchText) }
           }

           return universities
       }
}
    
    


