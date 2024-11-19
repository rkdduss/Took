//
//  SignUpViewModel.swift
//  Took
//
//  Created by dgsw07 on 11/18/24.
//

import Foundation
import Alamofire

class SignUpViewModel: ObservableObject {
    @Published var email = ""
    @Published var username = ""
    @Published var password = ""
    @Published var studentNumber = ""
    @Published var signuperrorMessage : String? = nil
    
    let serverUrl = ServerUrl.shared
    
    func signUp() {
        print("싸인업호출됨")
        let url = serverUrl.getUrl(for: "/auth/join")
        
        guard let token = UserDefaults.standard.string(forKey: "accessToken") else {
            self.signuperrorMessage = "로그인이 필요합니다. 다시 시도해주세요."
            return
        }

        
        let headers: HTTPHeaders = [
            "Authorization": "Bearer \(token)"
        ]
        
        AF.request(url,method: .post, parameters: SignUpModel(email: email, username: username, password: password, studentNumber: studentNumber),encoder: JSONParameterEncoder.default, headers: headers)
            .validate(statusCode: 200..<300)
            .response { response in
                switch response.result {
                case .success:
                    print("성공")
                    self.signuperrorMessage = nil
                case .failure(let error):
                    print("오류 발생: \(error.localizedDescription)")
                    if let data = response.data,
                       let errorMessage = String(data: data, encoding: .utf8) {
                        print("서버 오류 메시지: \(errorMessage)")
                        self.signuperrorMessage = errorMessage 
                    } else {
                        self.signuperrorMessage = "예상치 못한 오류가 발생했습니다."
                    }
                }
            }
    }
    
    func checkEmail(str: String) -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}"
        return NSPredicate(format: "SELF MATCHES %@", emailRegex).evaluate(with: str)
    }

}
