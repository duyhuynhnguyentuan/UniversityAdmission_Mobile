//
//  CaculatorViewModel.swift
//  UniversityAdmission
//
//  Created by Duy Huỳnh Nguyễn Tuấn on 22/03/2024.
//

import Foundation

enum admissionMethodCases: String, CaseIterable{
    case thptqg = "Tuyển sinh bằng xét điểm THPTQG"
    case dgnl = "Tuyển sinh bằng xét điểm ĐGNL"
}
class CaculatorViewModel: ObservableObject{
  
    @Published var selectedMajor = Major(_id: "", name: "Chưa chọn", code: "", effectiveDate: "", note: "")
    @Published var selectedadmissionMethod: admissionMethodCases = .thptqg
    @Published var showResults = false
    @Published var failedResults = false
    @Published var Results = [CalculatorResponse]()
    init(){
        selectedadmissionMethod = .thptqg
        failedResults = false
    }
    func calculateScore(admissionMethodName: String, inputScore: Double, inputMajor: String){
        CalculatorService.requestDomain = "https://universityadmission.onrender.com/api/v1/calculate"
        CalculatorService.calculateScore(admissionMethodName: admissionMethodName, inputScore: inputScore, inputMajor: inputMajor){ result in
            switch result {
            case .success(let data):
                do {
                    let results = try JSONDecoder().decode([CalculatorResponse].self, from: data)
                    DispatchQueue.main.async {
                        self.Results = results
                        self.showResults = true
                        print(results)
                    }
                } catch {
                    print("Error decoding JSON in calculateScore(): \(error)")
                    // Handle decoding error
                }

            case .failure(let error):
                print("Network Error: \(error.localizedDescription)")
                self.showResults = true
                self.failedResults = true
                // Handle network error
            }
        }
    }
}
