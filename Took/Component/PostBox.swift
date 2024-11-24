//
//  PostBox.swift
//  Took
//
//  Created by dgsw07 on 11/24/24.
//

import SwiftUI

struct PostBox: View {
    @StateObject private var postViewModel = PostViewModel()
    var body: some View {
        Rectangle().frame(width: 340,height: 1)
            .padding(.bottom,85)
            .foregroundColor(.secondary.opacity(0.5))
            .overlay(alignment:.leading) {
                HStack {
                    VStack(alignment:.leading,spacing: 10) {
                        Text("3층에 냄새가 나요").font(.system(size: 14).weight(.medium))
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
                .padding(.top,10)
            }
    }
}

#Preview {
    PostBox()
}
