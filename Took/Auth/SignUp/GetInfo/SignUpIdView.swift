//
//  SignUpIdView.swift
//  Took
//
//  Created by dgsw07 on 11/24/24.
//

import SwiftUI



struct SignUpIdView: View {
    @StateObject private var viewModel = SignUpViewModel()
    @State var click = false
    @State var nameFieldStroke = false
    @State var isDuplicateChecked = false
    @State var isDuplicate = false
    @Environment(\.dismiss) private var dismiss
    @State private var next = false
    var userId = ["alswn", "kangkun", "pushduck", "kangyeon"]
    
    
    
    var body: some View {
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
                .offset(x:-155,y: -29)
            }
            VStack(alignment: .leading, spacing: 30) {
                Text("아이디를 입력해 주세요")
                    .font(.system(size: 22).weight(.semibold))
                    .padding(.vertical, 40)
                RoundedRectangle(cornerRadius: 14)
                    .stroke(nameFieldStroke ? .orange : .clear, lineWidth: 1.5)
                    .frame(width: 314, height: 58)
                    .background(.gray.opacity(0.1))
                    .cornerRadius(14)
                    .overlay {
                        HStack {
                            Image(systemName: "person.fill")
                                .font(.system(size: 24).weight(.regular))
                                .padding(.leading, 10)
                                .foregroundColor(.secondary)
                            TextField("아이디를 입력해주세요", text: $viewModel.email, onEditingChanged: { isEditing in
                                self.nameFieldStroke = isEditing
                            })
                            .onChange(of: viewModel.email) { change in
                                isDuplicateChecked = false
                                isDuplicate = false
                            }
                            .tint(Color.orange)
                            .font(.system(size: 14).weight(.regular))
                            .keyboardType(.alphabet)
                            .autocapitalization(.none)
                            Button {
                                if viewModel.email.count >= 4 {
                                    isDuplicateChecked = true
                                    isDuplicate = userCheck()
                                    click = true
                                }
                            } label: {
                                if !SignUpOn() {
                                    RoundedRectangle(cornerRadius: 10)
                                        .frame(width: 80, height: 40)
                                        .foregroundColor(.yellow)
                                        .overlay {
                                            Text("중복 체크하기")
                                                .font(.system(size: 12).weight(.regular))
                                                .foregroundColor(.white)
                                            
                                        }
                                        .padding(.trailing, 5)
                                } else {
                                    Image(systemName: "checkmark")
                                        .font(.system(size: 20))
                                        .foregroundColor(.color)
                                        .padding(.trailing,15)
                                }
                                
                            }
                        }
                    }
                if isDuplicateChecked && !isDuplicate {
                    Text("중복된 아이디 입니다.")
                        .font(.system(size: 14))
                        .foregroundColor(.red)
                        .offset(x: 10, y: -20)
                } else if isDuplicateChecked && isDuplicate {
                    Text("사용 가능한 아이디입니다.")
                        .font(.system(size: 14))
                        .foregroundColor(.green)
                        .offset(x: 10, y: -20)
                } else if viewModel.email.count < 4  {
                    Text("아이디는 4글자 이상이어야 합니다.")
                        .font(.system(size: 14))
                        .foregroundColor(.secondary)
                        .offset(x: 10, y: -20)
                }
            }
            Spacer()
            Button {
                next.toggle()
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
            NavigationLink(destination: SignUpPasswordView(),isActive: $next) {
                EmptyView()
            }
            

        }
        
        .navigationBarBackButtonHidden()
    }
    
    func SignUpOn() -> Bool {
        return isDuplicateChecked && isDuplicate && viewModel.email.count >= 4
    }
    
    func userCheck() -> Bool {
        return !userId.contains(viewModel.email)
    }
}

#Preview {
    SignUpIdView()
}
