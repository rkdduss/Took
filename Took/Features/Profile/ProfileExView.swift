//
//  ProfileExView.swift
//  Took
//
//  Created by dgsw07 on 11/24/24.
//

import SwiftUI

struct ProfileExView: View {
    @StateObject var viewModel = ProfileViewModel()

    var body: some View {
        VStack {
            ForEach(viewModel.userInfo) { info in
                HStack {
                    Text("\(info.studentNumber)")
                    Text(info.name)
                }
            }
        }
        .padding()
        .onAppear {
            viewModel.fetchUserInfo { success in
                if !success {
                    print("사용자 정보 로드 실패")
                }
            }
        }
    }
}


#Preview {
    ProfileExView()
}
