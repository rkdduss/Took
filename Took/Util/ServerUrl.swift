//
//  ServerUrl.swift
//  Took
//
//  Created by dgsw07 on 11/15/24.
//

import Foundation

struct ServerUrl {
    var baseUrl = "http://54.196.130.7:8080"
    
    func getUrl(for endpoint: String) -> String {
        return baseUrl + endpoint
    }
    static let shared = ServerUrl()
    
    private init() {}
}




