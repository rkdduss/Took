import SwiftUI
import Alamofire

struct alsdlasdkmsakdmaskView: View {
    @StateObject var viewModel = ViewModel()
    
    var body: some View {
        VStack {
            TextField("email", text: $viewModel.email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            SecureField("password", text: $viewModel.username)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            TextField("username", text: $viewModel.password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            TextField("number", text: $viewModel.studentNumber)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            Button {
                viewModel.login()
            } label: {
                Text("로그인")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
        }
        .padding()
    }
}

struct UserInfo: Codable {
    var email: String
    var username: String
    var password: String
    var studentNumber: String
    
    enum CodingKeys: String, CodingKey {
          case email = "email"
          case username = "username"
          case password = "password"
          case studentNumber = "studentNumber"
      }
}

class ViewModel: ObservableObject {
    @Published var email = ""
    @Published var username = ""
    @Published var password = ""
    @Published var studentNumber = ""
    
    
    
    let serverUrl = ServerUrl.shared
    
    func login() {
        let url = serverUrl.getUrl(for: "/auth/join")
        let parameters = UserInfo(email: email, username: username, password: password, studentNumber: studentNumber)
        print(parameters)
        AF.request(url, method: .post, parameters: parameters, encoder: JSONParameterEncoder.default)
            .validate(statusCode: 200..<300)
            .response { response in
                switch response.result {
                case .success:
                    print("성공적으로 요청을 보냈습니다.")
                case .failure(let error):
                    print("요청 실패: \(error.localizedDescription)")
                    if let httpResponse = response.response {
                        print("응답 코드: \(httpResponse.statusCode)")
                    }
                }
            }
    }
}

#Preview {
    alsdlasdkmsakdmaskView()
}
