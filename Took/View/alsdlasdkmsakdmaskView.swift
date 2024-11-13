import SwiftUI
import Alamofire

struct alsdlasdkmsakdmaskView: View {
    @StateObject var viewModel = ViewModel()
    
    var body: some View {
        VStack {
            TextField("id", text: $viewModel.username)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            SecureField("password", text: $viewModel.password)
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
    var username: String
    var password: String
}

class ViewModel: ObservableObject {
    @Published var username = ""
    @Published var password = ""
    
    func login() {
        let url = "https://d3a0-221-168-22-205.ngrok-free.app/join"
        let parameters = UserInfo(username: username, password: password)
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
