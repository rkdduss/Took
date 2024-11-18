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
    
    
    func BoardWrite() {
        let url = "http://54.196.130.7:8080/boards/write"
        let parameters = Board(title: title, content: content)
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
