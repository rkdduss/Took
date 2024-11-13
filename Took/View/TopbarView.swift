//
//  TopbarView.swift
//  Took
//
//  Created by dgsw07 on 10/11/24.
//

import SwiftUI

struct TopbarView: View {
    var body: some View {
        GeometryReader { scale in
            ZStack {
                
                    VStack {
                        HStack {
                            Image("subLogo")
                            Spacer()
                            NavigationLink {
                                EmptyView()
                            } label: {
                                Image(systemName: "person.crop.circle")
                                    .font(.system(size: 32).weight(.regular))
                                    .foregroundColor(.color)
                                    .padding(.top,6)
                            }
                        }
                        .padding(.horizontal, scale.size.width*0.06)
                        .padding(.top,scale.size.height*0.09)
                        Spacer()
                    }
                    .ignoresSafeArea()
                
            }
        }
    }
}

#Preview {
    TopbarView()
}
