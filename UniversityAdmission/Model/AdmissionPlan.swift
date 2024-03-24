//
//  AdmissionPlan.swift
//  UniversityAdmission
//
//  Created by Duy Huỳnh Nguyễn Tuấn on 23/03/2024.
//

import Foundation

struct AdmissionPlan: Decodable, Identifiable{
    var id: String? {
        return _id
    }
    var _id: String
    var planDescription: String
    var schoolYear: [String]
}
