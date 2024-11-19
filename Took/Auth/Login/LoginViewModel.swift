//
//  LoginViewModel.swift
//  Took
//
//  Created by dgsw07 on 11/18/24.
//

import Foundation
import Alamofire

class LoginViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var alertOn = false
    @Published var loginerrorMessage: String?
    let serverUrl = ServerUrl.shared
    
    var isLoginDisabled: Bool {
        email.isEmpty || password.isEmpty ||
        password.count < 8 || password.count > 32 ||
        !checkEmail(str: email)
    }
    
    func login() {
        let url = serverUrl.getUrl(for: "/auth/login")
        
        guard let token = UserDefaults.standard.string(forKey: "accessToken") else {
            return
        }
        
        let headers: HTTPHeaders = [
            "Authorization": "Bearer \(token)"
        ]
        
        AF.request(
            url,
            method: .post,
            parameters: LoginModel(
                email: email,
                password: password
            ),
            encoder: JSONParameterEncoder.default,
            headers: headers
        )
        .validate(statusCode: 200..<300)
        .responseDecodable(of: BaseResponse<TokenResponse>.self) { response in
            switch response.result {
            case .success(let result):
                self.loginerrorMessage = nil
                UserDefaults.standard.set(result.data.accessToken, forKey: "accessToken")
                UserDefaults.standard.set(result.data.refreshToken, forKey: "refreshToken")
                print("성공")
            case .failure(let error):
                self.alertOn = true
                self.loginerrorMessage = "이메일과 비밀번호를 다시 입력해주세요."
                print("실패: \(error.localizedDescription)")
            }
        }
    }
    func checkEmail(str: String) -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}"
        return NSPredicate(format: "SELF MATCHES %@", emailRegex).evaluate(with: str)
    }
}
