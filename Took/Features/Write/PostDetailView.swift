//
//  PostDetailView.swift
//  Took
//
//  Created by dgsw07 on 10/31/24.
//

import SwiftUI

struct PostDetailView: View {
    @Environment(\.dismiss) var dismiss
    @State var heartOn = false
    @State var commentOn = false
    var post: Post
    var body: some View {
        VStack {
            HStack {
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "chevron.left")
                        .font(.system(size: 30))
                        .foregroundColor(.black)
                }
                Spacer().frame(width: 320)
            }
            .padding()
            VStack(alignment:.leading) {
                Text(post.title)
                    .font(.system(size: 24).weight(.bold))
                    .padding(.bottom,7)
                HStack {
                    Text("카테고리: \(post.category)")
                        .font(.system(size: 12).weight(.regular))
                        .foregroundColor(.secondary.opacity(0.8))
                    Button {
                        heartOn.toggle()
                    } label: {
                        Image(systemName: "heart").font(.system(size: 12).weight(.regular))
                            .foregroundColor(.fileUpload)
                    }
                    Button {
                        commentOn.toggle()
                    } label: {
                        Image(systemName: "bubble.right").font(.system(size: 11).weight(.regular))
                            .foregroundColor(.fileUpload)
                    }.padding(.bottom,-0.8)
                }
                
            }
            .padding(.trailing,45)
            .padding(.bottom,20)
            Rectangle()
                .frame(width: 340,height: 0.7)
                .foregroundColor(.secondary.opacity(0.6))
            
            ScrollView {
                LazyVStack(alignment:.leading) {
                    Text("본문")
                        .padding(.bottom,25)
                    Rectangle()
                        .frame(width: 250,height: 210)
                        .foregroundColor(.secondary)
                    HStack {
                        Spacer()
                        Text(post.createdAt)
                        Text("작성자: \(post.id)")
                    }
                    .font(.system(size: 12).weight(.regular))
                    .foregroundColor(.secondary)
                    .padding(30)
                }
                .lineSpacing(5)
                .font(.system(size: 14).weight(.regular))
                .padding(.leading,30)
                .padding(.top,20)
            }
        }
        .navigationBarBackButtonHidden()
    }
}
