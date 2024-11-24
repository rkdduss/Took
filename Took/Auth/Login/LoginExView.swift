//
//  LoginExView.swift
//  Took
//
//  Created by dgsw07 on 11/24/24.
//

import SwiftUI

struct LoginExView: View {
    @StateObject var loginViewModel = LoginViewModel()
    @State private var isLoginSuccess = false
    @State private var showAlert = false
    @State private var userInfo: UserData? = nil

    var body: some View {
        VStack {
            Group {
                TextField("이메일",text: $loginViewModel.email).textInputAutocapitalization(.never)
                TextField("비밀번호",text: $loginViewModel.password).textInputAutocapitalization(.never)
            }
            .padding()

            Button("로그인") {
                loginViewModel.login { success in
                    if success {
                        
                        isLoginSuccess = true
                    } else {
                        print(loginViewModel.loginerrorMessage ?? "로그인 실패")
                        showAlert = true
                    }
                }
                
            }
            NavigationLink(destination:MainView(),isActive: $isLoginSuccess) {
                EmptyView()
            }
        }
        .alert(isPresented: $showAlert) {
            Alert(
                title: Text("로그인 실패"),
                message: Text("다시 시도해 주세요."),
                dismissButton: .default(Text("확인"))
            )
        }
    }
}

#Preview {
    LoginExView()
}
