//
//  User.swift
//  UniversityAdmission
//
//  Created by Duy Huỳnh Nguyễn Tuấn on 13/03/2024.
//

import Foundation
struct UserRegisterResponse: Identifiable, Decodable {
    var _id: String
    var id: String? {
        return _id
    }
    var firstname: String
    var lastname: String
    var email: String
    var mobile: String
    var password: String
    var role: String
    var gender: String
    var isBlocked: Bool
    var createdAt: String
    var updatedAt: String
    var __v : Int
}
struct fetchUserResponse: Identifiable, Decodable {
    var _id: String
    var id: String? {
        return _id
    }
    var firstname: String
    var lastname: String
    var email: String
    var mobile: String
    var role: String
    var gender: String
    var isBlocked: Bool
    var createdAt: String
    var updatedAt: String
    var __v : Int
    var refreshToken: String
}


struct UserLoginResponse: Identifiable, Decodable{
    var _id: String
    var id: String? {
        return _id
    }
    var firstname: String
    var lastname: String
    var mobile:String
    var email: String
    var role: String
    var token: String
}
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
