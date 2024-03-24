//
//  Major.swift
//  UniversityAdmission
//
//  Created by Duy Huỳnh Nguyễn Tuấn on 06/03/2024.
//

import Foundation
import SwiftUI

struct Major: Identifiable, Decodable, Hashable{
    var _id: String
    var id: String? {
        return _id
    }
    var name: String
    var code: String
    var effectiveDate: String
    var note: String
    
    //optional reference object
    var AdmissionMethod: [AdmissionMethod]?

}
