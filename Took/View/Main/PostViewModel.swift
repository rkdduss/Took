//
//  PostViewModel.swift
//  Took
//
//  Created by dgsw07 on 11/15/24.
//

import Foundation
import Alamofire

class PostViewModel: ObservableObject {
    @Published var post: [Post] = []
    @Published var errorMessage = ""
    let serverUel = ServerUrl.shared
    private var accessToken: String {
          return UserDefaults.standard.string(forKey: "accessToken") ?? ""
      }
    
    func fetchPosts() {
        let url = serverUel.getUrl(for: "/posts")
        let headers : HTTPHeaders = [
            "Content-Type" : "application/json",
            "Authorization": "Bearer \(accessToken)"
        ]
        
        AF.request(
            url,
            method: .get,
            encoding: JSONEncoding.default,
            headers: headers
        )
        .validate(statusCode: 200..<300)
        .responseDecodable(of: PostResponse.self) { response in
            switch response.result {
            case.success(let response):
                print("게시글 가져오기 성공")
                self.post = response.data
            case.failure(let error):
                self.errorMessage = "오류발생"
                print("error: \(error.localizedDescription)")
            }
        }
    }
}
