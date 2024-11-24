


import Foundation
import Alamofire

class LoginViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var isSecure: Bool = true
    @Published var loginerrorMessage: String?
    let serverUrl = ServerUrl.shared
    
    var isLoginDisabled: Bool {
        email.isEmpty || password.isEmpty
    }
    func login(completion: @escaping (Bool) -> Void) {
        let url = serverUrl.getUrl(for: "/auth/login")
        let params = LoginModel(
            email: email, 
            password: password
        )
        
        AF.request(
            url,
            method: .post,
            parameters: params,
            encoder: JSONParameterEncoder.default
        )
        .validate(statusCode: 200..<300)
        .responseDecodable(of: TokenResponse.self) { response in
            switch response.result {
            case .success(let tokenResponse):
                print("로그인 성공")
                UserDefaults.standard.setValue(tokenResponse.data.accessToken, forKey: "accessToken")
                UserDefaults.standard.setValue(tokenResponse.data.refreshToken, forKey: "refreshToken")
                completion(true)
            case .failure(let error):
                self.loginerrorMessage = error.localizedDescription
                print(error.localizedDescription)
                completion(false)
            }
        }
    }
}
