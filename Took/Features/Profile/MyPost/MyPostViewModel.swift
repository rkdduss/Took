//
//  MyPostViewModel.swift
//  Took
//
//  Created by dgsw07 on 11/24/24.
//
import Alamofire
import Foundation

class MyPostViewModel: ObservableObject {
    @Published var post: [Post] = []
    @Published var errorMessage = ""
    let serverUel = ServerUrl.shared
    private var accessToken: String {
          return UserDefaults.standard.string(forKey: "accessToken") ?? ""
      }
    
    func fetchMyPosts() {
        let url = serverUel.getUrl(for: "/posts/me")
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
    func updatePost(postId: Int, title: String, category: String, content: String) {
          let url = serverUel.getUrl(for: "/posts/\(postId)/edit?category=\(category)")
          let parameters: [String: Any] = [
              "title": title,
              "content": content
          ]
          
          let headers: HTTPHeaders = [
              "Content-Type": "application/json",
              "Authorization": "Bearer \(accessToken)"
          ]
        
          
          AF.request(url, method: .patch, parameters: parameters, encoding: JSONEncoding.default, headers: headers)
              .validate(statusCode: 200..<300)
              .response { response in
                  switch response.result {
                  case .success:
                      print("게시글 수정 성공")
                      self.fetchMyPosts()
                  case .failure(let error):
                      self.errorMessage = "게시글 수정 실패"
                      print("error: \(error.localizedDescription)")
                  }
              }
      }
  }

