//
//  Province.swift
//  UniversityAdmission
//
//  Created by Duy Huỳnh Nguyễn Tuấn on 29/02/2024.
//

import Foundation
import SwiftUI

struct Province: Identifiable, Decodable {
    var _id: String
    var province: String
    var areaCode: String
    var id: String? {
        return _id
    }//computed property
    
    //optional property
    var university: [University]?
}
