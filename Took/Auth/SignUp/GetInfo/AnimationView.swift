//
//  AnimationView.swift
//  Took
//
//  Created by dgsw07 on 12/3/24.
//

import SwiftUI

struct AnimationView: View {
    var body: some View {
        GeometryReader { geo in
            Image("Final")
                .resizable()
                .scaledToFit()
                .overlay {
                    VStack(spacing: 20) {
                        animationCapsule(geo: geo)
                        animationCapsule(geo: geo)
                        animationCapsule(geo: geo)
                        animationCapsule(geo: geo)
                    }
                    
                }
        }
        .frame(width: 300, height: 300, alignment: .center)
    }
    
    private func animationCapsule(geo: GeometryProxy) -> some View {
        CapsuleAnimationView(geo: geo)
    }
}

struct CapsuleAnimationView: View {
    @State private var isExpanded = false
    let geo: GeometryProxy

    var body: some View {
        Capsule()
            .frame(width: isExpanded ? 46 : 0, height: 10)
            .padding(.trailing, isExpanded ? 113 : 66)
            .animation(.easeInOut(duration: 1).repeatForever(autoreverses: true), value: isExpanded)
            .onAppear {
                isExpanded.toggle()
            }
    }
}

#Preview {
    AnimationView()
}
