//
//  CommentView.swift
//  Took
//
//  Created by dgsw07 on 11/25/24.
//

import SwiftUI

struct CommentView: View {
    @Environment(\.dismiss) var dismiss
    @StateObject var viewModel = CommentViewModel()
    @State var comment = ""
    var postId: Int
    
    var body: some View {
        VStack {
            ForEach(viewModel.comment) { comments in
                Text(comments.createdAt)
                Text(comments.content)
                
                ScrollView {
                    LazyVStack {
                        
                        
                    }
                }
            }
        }
//        VStack(alignment:.leading) {
//            HStack {
//                Button {
//                    dismiss()
//                } label: {
//                    Image(systemName: "chevron.left").foregroundColor(.black)
//                        .font(.system(size: 30))
//                        .foregroundColor(.black)
//                        .padding(.bottom,20)
//                }
//                    
//            }
//            Text("댓글 \(viewModel.comment.count)")
//                .font(.system(size: 26).weight(.medium))
//                .padding(.bottom,10)
//
//            Rectangle()
//                .frame(maxWidth: 350,maxHeight: 1)
//                .foregroundColor(.secondary.opacity(0.6))
//                .padding(.bottom,30)
//            ScrollView {
//                LazyVStack(alignment:.leading) {
//                    HStack(alignment:.top) {
//                        Image(systemName: "person.crop.circle")
//                            .font(.system(size: 24))
//                            .foregroundColor(.secondary)
//                            .padding(.trailing,10)
//                        VStack {
//                            RoundedRectangle(cornerRadius: 14)
//                                .stroke(lineWidth: 0.7)
//                                .frame(width: 300,height: 100)
//                                .foregroundColor(.secondary)
//                                .overlay {
//                                    TextEditor(text: $comment)
//                                        .frame(width: 290,height: 90)
//                                }
//                                
//                            Button {
//                                print("click")
//                            } label: {
//                                RoundedRectangle(cornerRadius: 4)
//                                    .frame(width: 300,height: 35)
//                                    .foregroundColor(.requestButton)
//                                    .overlay {
//                                        Text("댓글 달기")
//                                            .font(.system(size: 12).weight(.medium))
//                                            .foregroundColor(.color)
//                                    }
//                            }
//
//                        }
//                    }
//                    VStack(alignment:.leading) {
//                        ForEach(viewModel.comment) { comments in
//                            CommentBox(comment: comments)
//                        }
//                    }
//                    
//                }
//            }
//        }
//        .padding(.horizontal,20)
//        .onAppear {
//            viewModel.fetchComments(postId: postId) { success in
//                if success {
//                    print("댓글 로드 성공")
//                } else {
//                    print("댓글 로드 실패")
//                }
//            }
//        }
    }
}
                   

#Preview {
    CommentView(postId: 12)
}


