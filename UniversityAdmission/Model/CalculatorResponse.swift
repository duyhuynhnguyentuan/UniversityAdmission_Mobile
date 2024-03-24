//
//  CalculatorResponse.swift
//  UniversityAdmission
//
//  Created by Duy Huỳnh Nguyễn Tuấn on 22/03/2024.
//

import Foundation

struct CalculatorResponse: Decodable, Identifiable {
    var id: String
    var AdmissionScore: Double
    var NumberOfStudent: Int
    var schoolYear: [Int64]
    var university: [String]
}

