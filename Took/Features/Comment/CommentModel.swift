//
//  CommentModel.swift
//  Took
//
//  Created by dgsw07 on 11/25/24.
//

import Foundation
//
struct Comment: Identifiable, Codable {
    let id: Int
    let postTitle: String
    let writer: String
    let content: String
    let likes: Int
    let isMine: Bool
    let createdAt: String
}

struct CommentResponse: Decodable {
    let data: [Comment]
    let status: Int
    let message: String
}
//
//
//struct Post: Identifiable, Codable {
//    let id: Int
//    let title: String
//    let category: String
//    let likes: Int
//    let comments: [Comment]
//    let isMine: Bool
//    let createdAt: String
//}
//
//
//struct PostResponse: Codable {
//    let data: [Post]
//    let status: Int
//    let message: String
//}
