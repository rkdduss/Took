//
//  SignUpView.swift
//  Took
//
//  Created by dgsw07 on 10/14/24.
//

import SwiftUI

struct SignUpView: View {
    @StateObject var viewModel = SignUpViewModel()
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
                                TextField("이름을 입력해주세요",text: $viewModel.username, onEditingChanged: { isEditing in
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
                                TextField("학번을 입력해주세요 (1116)",text: $viewModel.studentNumber, onEditingChanged: { isEditing in
                                    self.idFieldStroke = isEditing
                                })
                                .keyboardType(.numberPad)
                                .font(.system(size: 14).weight(.regular))
                            }
                        }
                }
                Spacer()
                Button {
                    
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
                NavigationLink(destination: SignUpIdView(), isActive: $next) {
                    EmptyView()
                }

            }
        
        .navigationBarBackButtonHidden()
    }
    func SignUpOn () -> Bool {
        if viewModel.username.isEmpty || viewModel.studentNumber.count < 4 {
            return false
        } else {
            return true
        }
    }
}




#Preview {
    SignUpIdView()
}
