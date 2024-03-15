//
//  AdmissionMethod.swift
//  UniversityAdmission
//
//  Created by Duy Huỳnh Nguyễn Tuấn on 11/03/2024.
//

import Foundation

struct AdmissionMethod: Identifiable, Decodable, Hashable {
    var _id: String
    var id: String? {
        return _id
    }
    var name: String
    var AdmissionScore: Int
    var NumberOfStudent: Int
    var MajorInPlan: [String]?
    
}
