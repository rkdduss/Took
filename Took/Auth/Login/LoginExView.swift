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
        ZStack {
            Color.color
            VStack {
                Spacer()
                HStack {
                    Image("circle")
                    Spacer()
                }
            }
            VStack {
                Image("Logo")
                Group {
                    CustomTextField(placeholder: Text("아이디를 입력해주세요").foregroundColor(.white).font(.system(size: 14).weight(.regular)), text: $loginViewModel.email)
                        .frame(width: 314, height: 58)
                        .padding(.leading, 20)
                        .background(
                            RoundedRectangle(cornerRadius: 14)
                                .stroke(lineWidth: 2)
                                .foregroundColor(Color.white)
                                .overlay {
                                    Color.white.opacity(0.4)
                                        .cornerRadius(14)
                                }
                        )
                    
                    CustomTextField(placeholder: Text("비밀번호를 입력해주세요").foregroundColor(.white).font(.system(size: 14).weight(.regular)), text: $loginViewModel.password, isSecure: true)
                        .frame(width: 314, height: 58)
                        .padding(.leading, 20)
                        .background(
                            RoundedRectangle(cornerRadius: 14)
                                .stroke(lineWidth: 2)
                                .foregroundColor(Color.white)
                                .overlay {
                                    Color.white.opacity(0.4)
                                        .cornerRadius(14)
                                }
                        )
                }
                .textInputAutocapitalization(.never)
                HStack {
                    Text("계정이 없으신가요?")
                        .foregroundColor(.white)
                        .font(.system(size: 13).weight(.regular))
                    NavigationLink {
                        SignUpView()
                    } label: {
                        Text("회원가입")
                        .foregroundColor(.color)
                        .underline()
                        .font(.system(size: 13).weight(.regular))
                    }
                }
                Button(action: {
                    loginViewModel.login { success in
                        if success {
                            
                            isLoginSuccess = true
                        } else {
                            print(loginViewModel.loginerrorMessage ?? "로그인 실패")
                            showAlert = true
                        }
                    }
                }, label: {
                    RoundedRectangle(cornerRadius: 14)
                        .frame(width: 314, height: 58)
                        .foregroundColor(.white)
                        .overlay(
                            Text("로그인")
                                .kerning(1.5)
                                .font(.system(size: 20).weight(.semibold))
                                .foregroundColor(LoginOn() ? Color.color : Color.secondary)
                        )
                })

                NavigationLink(destination:MainView(),isActive: $isLoginSuccess) {
                    EmptyView()
                }
            }
        }
        .ignoresSafeArea()
        .alert(isPresented: $showAlert) {
            Alert(
                title: Text("로그인 실패"),
                message: Text("다시 시도해 주세요."),
                dismissButton: .default(Text("확인"))
            )
        }
    }
    func LoginOn () -> Bool {
        if loginViewModel.email.isEmpty || loginViewModel.password.isEmpty {
            return false
        } else {
            return true
        }
    }
}

#Preview {
    LoginExView()
}
