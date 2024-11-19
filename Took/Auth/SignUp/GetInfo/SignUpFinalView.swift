//
//  SignUpFinalView.swift
//  Took
//
//  Created by dgsw07 on 10/16/24.
//

import SwiftUI

struct SignUpFinalView: View {
    @State var password = ""
    @State var passwordCheck = ""
    @State var nameFieldStroke = false
    @State var idFieldStroke = false
    @State var loginSuccess = false
    @State var next = false
    @State var isExpanded1 = true
    
    @FocusState private var isPasswordFieldFocused: Bool
    @Environment(\.dismiss) private var dismiss
    var body: some View {
    
            VStack {
                Image("subLogo")
                    .padding(.top,13)
                Group {
                    VStack(alignment:.center,spacing: 30) {
                        HStack {
                            Text("툭")
                                .font(.system(size: 40).weight(.bold))
                                .foregroundColor(.color)
                                .rotationEffect(.degrees(-10))
                            Text("회원가입을 환영해요!")
                                .font(.system(size: 22).weight(.semibold))
                                .padding(.vertical,40)
                                .padding(.top,6)
                        }
                    }
                    
                }
                .frame(height: 185)
                
                ZStack {
                    Image("Final")
                }.padding(.top,35)
                Spacer()
                Button {
                    next.toggle()
                } label: {
                    RoundedRectangle(cornerRadius: 14)
                        .frame(width: 314, height: 58)
                        .foregroundColor(.color)
                        .overlay(
                            Text("회원가입 완료")
                                .kerning(1.5)
                                .font(.system(size: 20).weight(.semibold))
                                .foregroundColor(.white)
                        )
                    
                }
                NavigationLink(destination: MainView(),isActive: $next) {
                    EmptyView()
                }

            }
            .navigationBarBackButtonHidden()
        
    }
    private func startAnimation1() {
        withAnimation(Animation.easeInOut(duration: 1).repeatForever(autoreverses: true)) {
            isExpanded1.toggle()
        }
    }
}

#Preview {
    SignUpFinalView()
}
