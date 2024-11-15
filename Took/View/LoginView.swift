import SwiftUI

struct LoginView: View {
    @State private var id = ""
    @State private var password = ""
    @ObservedObject var loginVM = LoginViewModel(user: User(name: "박민주", classId: "1116", id: "alswn", password: "alswn"))
    @State var showProgrees = false

    var body: some View {
        GeometryReader { scale in
                ZStack {
                    Color.color
                        .ignoresSafeArea()
                    Image("circle")
                        .offset(x: -37, y: 150)
                    
                    VStack(spacing: 35) {
                        Image("Logo")
                            .padding(.top, 90)
                        Spacer()
                        
                        Group {
                            CustomTextField(placeholder: Text("아이디를 입력해주세요").foregroundColor(.white).font(.system(size: 14).weight(.regular)), text: $id)
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
                            
                            CustomTextField(placeholder: Text("비밀번호를 입력해주세요").foregroundColor(.white).font(.system(size: 14).weight(.regular)), text: $password, isSecure: true)
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
                        .autocapitalization(.none)
                        .offset(y: scale.size.height * 0.05)
                        .padding(.bottom, (scale.size.height * 0.4))
                        .padding(.top, (scale.size.height * -0.01))
                        .padding(.vertical, (scale.size.height * -0.195))
                        
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
                        
                        Button {
                            loginVM.login(id: id, password: password)
                            showProgrees = true
                        } label: {
                            RoundedRectangle(cornerRadius: 14)
                                .frame(width: 314, height: 58)
                                .foregroundColor(.white)
                                .overlay(
                                    Text("로그인")
                                        .kerning(1.5)
                                        .font(.system(size: 20).weight(.semibold))
                                        .foregroundColor(LoginOn() ? Color.color : Color.secondary)
                                )
                        }
                        .offset(y: -30)
                        
                        NavigationLink(destination: MainView(), isActive: $loginVM.isLogin) {
                            EmptyView()
                        }
                    }
                }
            }
            .navigationBarBackButtonHidden()
            .alert(isPresented: $loginVM.alertOn) {
                Alert(
                    title: Text("로그인 실패"),
                    message: Text("아이디 혹은 비밀번호가 일치하지 않습니다"),
                    dismissButton: .default(Text("확인"))
                )
            }
        }
    
    

    func LoginOn () -> Bool {
        if id.isEmpty || password.isEmpty {
            return false
        } else {
            return true
        }
    }
    func progressView () -> Bool {
        return loginVM.isLogin == true
    }
}

#Preview {
    LoginView()
}
