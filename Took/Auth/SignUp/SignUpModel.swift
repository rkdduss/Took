//
//  SignUpModel.swift
//  Took
//
//  Created by dgsw07 on 11/18/24.
//

import Foundation


struct SignUpModel: Codable {
    var email: String
    var username: String
    var password: String
    var studentNumber: Int
 
}


struct SignUpResponse: Decodable {
    var email: String
    var username: String
    var password: String
    var studentNumber: Int
}


