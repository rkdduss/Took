//
//  TokenResponse.swift
//  Took
//
//  Created by dgsw07 on 11/18/24.
//

import Foundation



struct TokenResponse: Codable {
    let data: TokenData
    let status: Int
    let message: String
}

struct TokenData: Codable {
    let accessToken: String
    let refreshToken: String
}
