//
//  SignUpExView.swift
//  Took
//
//  Created by dgsw07 on 11/24/24.
//

import SwiftUI

struct SignUpExView: View {
    @State var showMain = false
    @StateObject var viewModel = SignUpViewModel()
    var body: some View {
        VStack {
            Group {
                TextField("이메일",text: $viewModel.email).textInputAutocapitalization(.never)
                TextField("이름",text: $viewModel.username).textInputAutocapitalization(.never)
                TextField("학번",text: $viewModel.studentNumber).textInputAutocapitalization(.never)
                TextField("비밀번호",text: $viewModel.password).textInputAutocapitalization(.never)
            }
            .padding()
            
            Button {
                Task {
                    let signupResult = await viewModel.signup()
                    if signupResult {
                        showMain = true
                    } else {
                        print("회원가입 실패")
                    }
                }
            } label: {
                Text("Button")
            }
            NavigationLink(destination: LoginExView(),isActive:$showMain) {
                EmptyView()
            }
        }
    }
}

#Preview {
    SignUpExView()
}
