//
//  MyPostView.swift
//  Took
//
//  Created by dgsw07 on 11/18/24.
//

import SwiftUI

struct MyPostView: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack(alignment: .leading) {
            ZStack {
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "chevron.left").foregroundColor(.black)
                        .font(.system(size: 30))
                        .foregroundColor(.black)
                }
            }
            .offset(x:-45,y: 10)
            
            HStack(spacing:10) {
                Text("내가 쓴 글")
                    .font(.system(size: 23).weight(.medium))
                    .padding(.top,10)
                
                Text("7")
                    .font(.system(size: 16).weight(.medium))
                    .foregroundColor(.color)
                    .padding(.top,15)
            }
            .frame(height: 20)
            .padding(.trailing,135)
            .offset(y:-23)
        }
        ScrollView {
            LazyVStack {
                ForEach(1..<10) { i in
                    Rectangle().frame(width: 340,height: 1)
                        .padding(.bottom,110)
                        .foregroundColor(.secondary.opacity(0.5))
                        .overlay(alignment:.leading) {
                            HStack {
                                VStack(alignment:.leading,spacing: 10) {
                                    Text("3층 화장실에서 냄새가 나요").font(.system(size: 14).weight(.medium))
                                    Text("2024.10.10")
                                        .font(.system(size: 12).weight(.regular))
                                        .foregroundColor(.tookgray)
                                }
                                Spacer().frame(width: 100)
                                VStack {
                                    Text("카테고리: 악취")
                                        .font(.system(size: 12).weight(.regular))
                                        .foregroundColor(.tookgray)
                                    Spacer().frame(height: 10)
                                    HStack {
                                        Image(systemName: "heart")
                                            .foregroundColor(.fileUpload)
                                        Image(systemName: "bubble.right")
                                            .font(.system(size: 15))
                                            .foregroundColor(.fileUpload)
                                    }
                                }
                            }
                        }
                }
            }
        }
        
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    MyPostView()
}
