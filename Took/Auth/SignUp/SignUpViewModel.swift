import Alamofire
import Foundation


class SignUpViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var username: String = ""
    @Published var studentNumber: String = ""
    
    let serverUrl = ServerUrl.shared
    @Published var isSecure: Bool = true
    @Published var signupErrorMessage: String? = nil
    @Published var isTimerRunning: Bool = false
    @Published var remainingTime: Int = 0
    
    func startCountdown() {
        remainingTime = 300
        isTimerRunning = true
        
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
            DispatchQueue.main.async {
                if self.remainingTime > 0 {
                    self.remainingTime -= 1
                } else {
                    timer.invalidate()
                    self.isTimerRunning = false
                }
            }
        }
    }
    
    var isSignupDisabled: Bool {
        username.isEmpty || password.isEmpty
    }
    
    func signup() async -> Bool {
        guard let studentNumberInt = Int(studentNumber), studentNumberInt > 0 else {
            self.signupErrorMessage = "학번은 숫자여야 합니다."
            return false
        }
        
        let url = serverUrl.getUrl(for: "/auth/join")
        let params = SignUpModel(
                email: email,
                username: username,
                password: password,
                studentNumber: studentNumberInt
            )
        
        return await withCheckedContinuation { continuation in
            AF.request(url, method: .post, parameters: params, encoder: JSONParameterEncoder.default)
                .validate()
                .responseDecodable(of: SignUpResponse.self) { response in
                    switch response.result {
                    case .success(let responseData):
                        print("회원가입 성공: \(responseData)")
                        self.signupErrorMessage = "예상치 못한 오류가 발생했습니다."
                        continuation.resume(returning: false)
                    case .failure(_):
                        if let data = response.data, let serverMessage = String(data: data, encoding: .utf8) {
                            print("서버 오류 메시지: \(serverMessage)")
                        }
                        self.signupErrorMessage = nil
                        continuation.resume(returning: true)
                    }
                }
        }
    }
}
