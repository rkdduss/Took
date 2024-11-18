//
//  PostModel.swift
//  Took
//
//  Created by dgsw07 on 11/15/24.
//

import Foundation

struct PostModel : Identifiable {
    var id: Int
    var title: String
    var content: String
    var userId: String
    var comment: Comment
    var likes: Int
    
    struct Comment {
        var id: Int
        var userId: String
        var content: String
        var post: String
        var likes: Int
    }
}
