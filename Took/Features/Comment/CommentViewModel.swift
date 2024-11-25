

import Alamofire
import Foundation

class CommentViewModel: ObservableObject {
    @Published var comment: [Comment] = []
    @Published var errorMessage = ""
    
    let serverUrl = ServerUrl.shared
    
    func fetchComments(postId: Int, completion: @escaping (Bool) -> Void) {
        guard let token = UserDefaults.standard.string(forKey: "accessToken"), !token.isEmpty else {
            self.errorMessage = "인증 토큰이 없습니다."
            completion(false)
            return
        }

        let headers: HTTPHeaders = [
            "Authorization": "Bearer \(token)",
            "Accept": "application/json"
        ]
        let url = serverUrl.getUrl(for: "/comments/\(postId)")
        
        AF.request(url, method: .get, headers: headers)
            .validate(statusCode: 200..<300)
            .responseDecodable(of: CommentResponse.self) { response in
                switch response.result {
                case .success(let fetchedComments):
                    DispatchQueue.main.async {
                        self.comment = fetchedComments.data
                        completion(true)
                    }
                case .failure(let error):
                    print("Error fetching comments: \(error.localizedDescription)")
                    if let statusCode = response.response?.statusCode, statusCode == 401 {
                        self.errorMessage = "토큰이 만료되었습니다. 다시 로그인 해주세요."
                        completion(false)
                    } else {
                        self.errorMessage = "댓글 로드 실패"
                        completion(false)
                    }
                }
            }
    }

}
