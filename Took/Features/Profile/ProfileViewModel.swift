import Alamofire
import Foundation



struct UserData: Identifiable, Codable {
    var id: Int 
    var email: String
    var studentNumber: Int
    var name: String
    var role: String
}



class ProfileViewModel: ObservableObject {
    @Published var userInfo: [UserData] = []
    @Published var errorMessage = ""
    @Published var isLoading = false

    let serverUrl = ServerUrl.shared

    func fetchUserInfo(completion: @escaping (Bool) -> Void) {
        let url = serverUrl.getUrl(for: "/users/me")
        isLoading = true

        
        guard let token = UserDefaults.standard.string(forKey: "accessToken") else {
            self.errorMessage = "인증 토큰이 없습니다."
            completion(false)
            return
        }

        let headers: HTTPHeaders = [
            "Authorization": "Bearer \(token)",
            "Accept": "application/json"
        ]

        
        AF.request(url, method: .get, headers: headers)
            .validate(statusCode: 200..<300)
            .responseDecodable(of: [UserData].self) { response in
                self.isLoading = false
                switch response.result {
                case .success(let userInfo):
                    self.userInfo = userInfo
                    print("사용자 정보 가져오기 성공")
                    print("서버 응답 데이터: \(userInfo)")
                    completion(true)
                case .failure(let error):
                    self.errorMessage = error.localizedDescription
                    if let response = response.response {
                        self.errorMessage += " 응답 코드: \(response.statusCode)"
                    }
                    print("에러 발생: \(error.localizedDescription)")
                    completion(false)
                }
            }
    }

}
