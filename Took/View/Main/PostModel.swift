//
//  PostModel.swift
//  Took
//
//  Created by dgsw07 on 11/15/24.
//

import Foundation


struct PostModel {
    var data: Post
    
    struct Post {
        var id:String
        var title:String
        var category:String
        var likes:Int
        var comments: Comment
        
        struct Comment {
            var id: Int
            var postTitle: String
            var writer: String
            var content: String
            var likes: Int
            var isMine: Bool
            var createdAt: String
        }
        
        var isMine:  Bool
        var createdAt: String
    }
    var status: Int
    var message: String
}

//{
//  "data": [
//    {
//      "id": 0,
//      "title": "string",
//      "category": "ODOR",
//      "likes": 0,
//      "comments": [
//        {
//          "id": 0,
//          "postTitle": "string",
//          "writer": "string",
//          "content": "string",
//          "likes": 0,
//          "isMine": true,
//          "createdAt": "2024-11-18"
//        }
//      ],
//      "isMine": true,
//      "createdAt": "2024-11-18"
//    }
//  ],
//  "status": 0,
//  "message": "string"
//}
