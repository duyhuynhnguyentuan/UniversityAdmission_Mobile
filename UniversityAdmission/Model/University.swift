//
//  University.swift
//  UniversityAdmission
//
//  Created by Duy Huỳnh Nguyễn Tuấn on 29/02/2024.
//

import Foundation
import SwiftUI

struct University: Identifiable, Decodable, Hashable {
    var _id: String
    var name: String
    var code: String
    var id: String? {
        return _id
    }
    var abbreviation: String
    var description: String
    var yearEstablish: Int
    var admissionPolicy: String
    var contactInfo: String
    var address: String
    
    //Reference property, could be optional
    var province: [Province]?
    var major: [Major]?
    var admissionPlan: [String]?
    func hash(into hasher: inout Hasher) {
            hasher.combine(_id)
        }
    static func == (lhs: University, rhs: University) -> Bool {
         return lhs._id == rhs._id
     }
    
}
