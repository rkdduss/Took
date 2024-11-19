import Foundation
import Alamofire

let serverUrl = ServerUrl.shared

class RefreshAccessToken {
    static let shared = RefreshAccessToken()

    private init() {}

    func reissue(completion: @escaping (Bool) -> Void) {
        let url = serverUrl.getUrl(for: "/auth/reissue")

        guard let refresh = UserDefaults.standard.string(forKey: "refresh") else {
            print("Refresh token이 존재하지 않습니다.")
            completion(false)
            return
        }

        print("재발급 요청 Refresh Token: \(refresh)")

        let parameter: [String: Any] = [
            "refresh": refresh
        ]

        AF.request(url,
                   method: .post,
                   parameters: parameter,
                   encoding: JSONEncoding.default
        )
        .validate()
        .responseDecodable(of: BaseResponse<TokenResponse>.self) { response in
            switch response.result {
            case .success(let baseResponse):
                let tokenResponse = baseResponse.data
                UserDefaults.standard.set(tokenResponse.accessToken, forKey: "access")
                UserDefaults.standard.set(tokenResponse.refreshToken, forKey: "refresh")
                print("토큰 재발급 성공")
                completion(true)

            case .failure(let error):
                print("토큰 발급 실패: \(error.localizedDescription)")

                if let httpResponse = response.response {
                    print("응답 코드: \(httpResponse.statusCode)")
                }

                if let data = response.data {
                    do {
                        let errorResponse = try JSONDecoder().decode(BaseResponse<String>.self, from: data)
                        print("서버 오류 메시지: \(errorResponse.message)")
                    } catch {
                        print("오류 메시지 디코딩 실패")
                    }
                }

                UserDefaults.standard.removeObject(forKey: "access")
                UserDefaults.standard.removeObject(forKey: "refresh")

                completion(false)
            }
        }
    }
}
