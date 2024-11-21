import SwiftUI

struct SignUpPasswordView: View {
    @State var password = ""
    @State var passwordCheck = ""
    @State var nameFieldStroke = false
    @State var idFieldStroke = false
    @State var loginSuccess = false
    @State var showFinalView = false
    @FocusState private var isPasswordFieldFocused: Bool
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        ZStack {
            VStack {
                Image("subLogo")
                    .padding(.top, 13)
                ZStack {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "chevron.left")
                            .font(.system(size: 30))
                            .foregroundColor(.black)
                    }
                    .offset(x: -155, y: -29)
                }
                VStack(alignment: .leading, spacing: 30) {
                    Text("비밀번호를 입력해 주세요")
                        .font(.system(size: 22).weight(.semibold))
                        .padding(.vertical, 40)
                    RoundedRectangle(cornerRadius: 14)
                        .stroke(nameFieldStroke ? .color : .clear, lineWidth: 1.5)
                        .frame(width: 314, height: 58)
                        .background(.gray.opacity(0.1))
                        .cornerRadius(14)
                        .overlay {
                            HStack {
                                Image(systemName: "lock.fill")
                                    .font(.system(size: 24).weight(.regular))
                                    .padding(.leading, 10)
                                    .foregroundColor(.secondary)
                                TextField("비밀번호를 입력해주세요", text: $password, onEditingChanged: { isEditing in
                                    self.nameFieldStroke = isEditing
                                })
                                .font(.system(size: 14).weight(.regular))
                                .keyboardType(.namePhonePad)
                                .autocapitalization(.none)
                            }
                        }
                    RoundedRectangle(cornerRadius: 14)
                        .stroke(idFieldStroke ? Color.color : .clear, lineWidth: 1.5)
                        .frame(width: 314, height: 58)
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(14)
                        .overlay {
                            HStack {
                                Image(systemName: "lock.fill")
                                    .font(.system(size: 24).weight(.regular))
                                    .padding(.leading, 10)
                                    .foregroundColor(.secondary)
                                
                                SecureField("비밀번호를 한번 더 입력해주세요", text: $passwordCheck)
                                    .font(.system(size: 14).weight(.regular))
                                    .autocapitalization(.none)
                                    .keyboardType(.namePhonePad)
                                    .focused($isPasswordFieldFocused)
                                    .onChange(of: isPasswordFieldFocused) { focused in
                                        idFieldStroke = focused
                                    }
                                Image(systemName: "checkmark")
                                    .font(.system(size: 20).weight(.regular))
                                    .foregroundColor(SignUpOn() ? .color : .clear)
                                    .padding(.trailing, 18)
                                    
                            }
                        }
                }
                Spacer()
                Button {
                    showFinalView = true
                } label: {
                    RoundedRectangle(cornerRadius: 14)
                        .frame(width: 314, height: 58)
                        .foregroundColor(SignUpOn() ? .color : .secondary.opacity(0.3))
                        .overlay(
                            Text("다음")
                                .kerning(1.5)
                                .font(.system(size: 20).weight(.semibold))
                                .foregroundColor(.white)
                        )
                }
                .disabled(!SignUpOn())
                NavigationLink(destination: SignUpFinalView(),isActive: $showFinalView) {
                    EmptyView()
                }
            }
            .navigationBarBackButtonHidden()
        }
        
    }
    
    func SignUpOn() -> Bool {
        return !password.isEmpty && password.count >= 8 && password == passwordCheck
    }
}


#Preview {
    SignUpPasswordView()
}
