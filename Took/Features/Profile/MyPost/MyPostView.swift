//
//  MyPostView.swift
//  Took
//
//  Created by dgsw07 on 11/18/24.
//

import SwiftUI

struct MyPostView: View {
    @StateObject var myPostViewModel = MyPostViewModel()
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "chevron.left").foregroundColor(.black)
                        .font(.system(size: 30))
                        .foregroundColor(.black)
                        .padding(.bottom,2)
                }
                Spacer().frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
                Text("내가 쓴 글")
                    .font(.system(size: 23).weight(.medium))
                    
                
                Text("\(myPostViewModel.post.count)")
                    .font(.system(size: 16).weight(.medium))
                    .foregroundColor(.color)
                    
            }
            .frame(height: 20)
            .padding(.leading,18)
            .padding(.top,20)
        
            ScrollView {
                LazyVStack {
                    ForEach(myPostViewModel.post) { myPost in
                        NavigationLink {
                            MyPostEditView(post: myPost)
                        } label: {
                            Rectangle().frame(width: 340,height: 1)
                                .padding(.bottom,110)
                                .foregroundColor(.secondary.opacity(0.5))
                                .overlay(alignment:.leading) {
                                    HStack {
                                        VStack(alignment:.leading,spacing: 10) {
                                            Text(myPost.title).font(.system(size: 14).weight(.medium))
                                            Text(myPost.createdAt)
                                                .font(.system(size: 12).weight(.regular))
                                                .foregroundColor(.tookgray)
                                        }
                                        Spacer()
                                        VStack {
                                            Text("카테고리: \(myPost.category)")
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
            }
        }
        .onAppear {
            myPostViewModel.fetchMyPosts()
        }
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    MyPostView()
}
