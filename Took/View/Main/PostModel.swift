//
//  PostModel.swift
//  Took
//
//  Created by dgsw07 on 11/15/24.
//

import Foundation


struct Post: Identifiable, Codable {
    let id: Int
    let title: String
    let category: String
    let likes: Int
    let comments: [Comment]
    let isMine: Bool
    let createdAt: String
}


struct PostResponse: Codable {
    let data: [Post]
    let status: Int
    let message: String
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
