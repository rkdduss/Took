//
//  BoradModel.swift
//  Took
//
//  Created by dgsw07 on 11/15/24.
//

import Foundation

struct Board : Codable, Identifiable {
    var id = UUID()
    var title: String
    var content: String
}
