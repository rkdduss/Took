//
//  SignUpView.swift
//  Took
//
//  Created by dgsw07 on 10/14/24.
//

import SwiftUI

struct SignUpView: View {
    @State var name = ""
    @State var classId = ""
    @State var nameFieldStroke = false
    @State var idFieldStroke = false
    @State var loginSuccess = false
    @State var next = false
    @Environment(\.dismiss) private var dismiss
    var body: some View {
            VStack {
                Image("subLogo")
                    .padding(.top,13)
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
                VStack(alignment:.leading,spacing: 30) {
                    Text("이름과 학번을 입력해주세요")
                        .font(.system(size: 22).weight(.semibold))
                        .padding(.vertical,40)
                    RoundedRectangle(cornerRadius: 14)
                        .stroke(nameFieldStroke ? .color : .clear,lineWidth: 1.5)
                        .frame(width: 314,height: 58)
                        .background(.gray.opacity(0.1))
                        .cornerRadius(14)
                        .overlay {
                            HStack {
                                Image(systemName: "person.fill").font(.system(size: 24).weight(.regular)).padding(.leading,10).foregroundColor(.secondary)
                                TextField("이름을 입력해주세요",text: $name, onEditingChanged: { isEditing in
                                    self.nameFieldStroke = isEditing
                                })
                                .font(.system(size: 14).weight(.regular))
                                .keyboardType(.default)
                            }
                        }
                    RoundedRectangle(cornerRadius: 14)
                        .stroke(idFieldStroke ? .color : .clear,lineWidth: 1.5)
                        .frame(width: 314,height: 58)
                        .background(.gray.opacity(0.1))
                        .cornerRadius(14)
                        .overlay {
                            HStack {
                                Image(systemName: "person.fill").font(.system(size: 24).weight(.regular)).padding(.leading,10).foregroundColor(.secondary)
                                TextField("학번을 입력해주세요 (1116)",text: $classId, onEditingChanged: { isEditing in
                                    self.idFieldStroke = isEditing
                                })
                                .keyboardType(.numberPad)
                                .font(.system(size: 14).weight(.regular))
                            }
                        }
                }
                Spacer()
                Button {
                    SignUpOn()
                    next.toggle()
                } label: {
                    RoundedRectangle(cornerRadius: 14)
                        .frame(width: 314, height: 58)
                        .foregroundColor(SignUpOn() ?  .color : .secondary.opacity(0.3))
                        .overlay(
                            Text("다음")
                                .kerning(1.5)
                                .font(.system(size: 20).weight(.semibold))
                                .foregroundColor(.white)
                        )
                }
                .disabled(!SignUpOn())
                NavigationLink(isActive: $next) {
                    SignUpIdView()
                } label: {
                    Text("")
                }

            }
        
        .navigationBarBackButtonHidden()
    }
    func SignUpOn () -> Bool {
        if name.isEmpty || classId.count < 4 {
            return false
        } else {
            return true
        }
    }
}

import SwiftUI

struct SignUpIdView: View {
    @State var sameID = ""
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
                            TextField("아이디를 입력해주세요", text: $sameID, onEditingChanged: { isEditing in
                                self.nameFieldStroke = isEditing
                            })
                            .onChange(of: sameID) { change in
                                isDuplicateChecked = false
                                isDuplicate = false
                            }
                            .tint(Color.orange)
                            .font(.system(size: 14).weight(.regular))
                            .keyboardType(.alphabet)
                            .autocapitalization(.none)
                            Button {
                                if sameID.count >= 4 {
                                    isDuplicateChecked = true
                                    isDuplicate = userCheck()
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
                } else if sameID.count < 4 && isDuplicateChecked {
                    Text("아이디는 4글자 이상이어야 합니다.")
                        .font(.system(size: 14))
                        .foregroundColor(.red)
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
//            NavigationLink(isActive: $next) {
//                SignUpPasswordView()
//            } label: {
//                Text("")
//            }

        }
        
        .navigationBarBackButtonHidden()
    }
    
    func SignUpOn() -> Bool {
        return isDuplicateChecked && isDuplicate && sameID.count >= 4
    }
    
    func userCheck() -> Bool {
        return !userId.contains(sameID)
    }
}

#Preview {
    SignUpView()
}
