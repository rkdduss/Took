//
//  CommentBox.swift
//  Took
//
//  Created by dgsw07 on 11/25/24.
//

import SwiftUI

struct CommentBox: View {
    var comment: Comment
    var body: some View {
        HStack(alignment:.top) {
            Image(systemName: "person.crop.circle")
                .font(.system(size: 24))
                .foregroundColor(.secondary)
                .padding(.trailing,10)
            Text(comment.content)
        }
    }
}
