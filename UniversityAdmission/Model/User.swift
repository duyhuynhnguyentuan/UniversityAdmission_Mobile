//
//  User.swift
//  UniversityAdmission
//
//  Created by Duy Huỳnh Nguyễn Tuấn on 13/03/2024.
//

import Foundation
struct UserApiResponse: Decodable{
    var user: User
    var refreshToken: String?
    var token: String?
}
struct User: Identifiable, Decodable {
    var _id: String
    var id: String? {
        return _id
    }
    var firstname: String
    var lastname: String
    var mobile:String
    var email: String
    var role: String
    var password: String?
    var gender: String?
    var address: String?
    var isBlocked: Bool?
}
