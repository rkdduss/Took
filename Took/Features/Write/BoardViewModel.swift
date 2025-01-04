//
//  BoardViewModel.swift
//  Took
//
//  Created by dgsw07 on 11/15/24.
//
import Alamofire
import Foundation

class BoardViewModel: ObservableObject {
    @Published var title = ""
    @Published var content = ""
    let serverUrl = ServerUrl.shared
    private var accessToken: String {
          return UserDefaults.standard.string(forKey: "accessToken") ?? ""
      }
      
    
    func BoardWrite(completion: @escaping (Bool) -> Void) {
        let url = serverUrl.getUrl(for: "/posts/write")
        let parameters = Board(title: title, content: content)
        print(parameters)
        
        let headers : HTTPHeaders = [
            "Content-Type" : "application/json",
            "Authorization": "Bearer \(accessToken)"
        ]

        
        AF.request(url, method: .post, parameters: parameters, encoder: JSONParameterEncoder.default, headers: headers)
            .validate(statusCode: 200..<300)
            .response { response in
                switch response.result {
                case .success:
                    print("성공적으로 요청을 보냈습니다.")
                    completion(true)
                case .failure(let error):
                    print("요청 실패: \(error.localizedDescription)")
                    if let httpResponse = response.response {
                        print("응답 코드: \(httpResponse.statusCode)")
                        completion(false)
                    }
                }
            }


    }

}
