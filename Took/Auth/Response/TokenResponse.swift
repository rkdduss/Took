//
//  TokenResponse.swift
//  Took
//
//  Created by dgsw07 on 11/18/24.
//

import Foundation

struct TokenResponse: Decodable {
    let accessToken: String
    let refreshToken: String
    
    enum CodingKeys: String, CodingKey {
        case accessToken = "access"
        case refreshToken = "refresh"
    }
}

struct BaseResponse<T: Decodable>: Decodable {
    let status: Int
    let message: String
    let data: T
}
