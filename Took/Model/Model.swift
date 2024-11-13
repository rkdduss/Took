//
//  Model.swift
//  Took
//
//  Created by dgsw07 on 9/19/24.
//

import Foundation

struct User: Encodable,Identifiable {
    var name: String
    var classId: String
    var id: String
    var password: String
}

struct Post: Identifiable {
    let id = UUID()
    var title: String
    var content: String
}


