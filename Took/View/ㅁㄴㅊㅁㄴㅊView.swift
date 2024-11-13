//
//  ㅁㄴㅊㅁㄴㅊView.swift
//  Took
//
//  Created by dgsw07 on 10/16/24.
//

import SwiftUI

struct ㅁㄴㅊㅁㄴㅊView: View {
    @State private var animate = false
    
    var body: some View {
        VStack {
            // 애니메이션이 적용되지 않는 부분
            Text("일반 텍스트")
                .padding()
            
            // 애니메이션이 적용되는 부분
            AnimatedView(animate: $animate)
            
            Button("애니메이션 시작") {
                withAnimation {
                    animate.toggle()
                }
            }
        }
    }
}

struct AnimatedView: View {
    @Binding var animate: Bool
    
    var body: some View {
        RoundedRectangle(cornerRadius: 14)
            .fill(animate ? Color.red : Color.blue)
            .frame(width: 100, height: 100)
            .animation(.easeInOut, value: animate) // 애니메이션 적용
    }
}

#Preview {
    ㅁㄴㅊㅁㄴㅊView()
}
