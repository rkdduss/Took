//
//  SplashScreenView.swift
//  Took
//
//  Created by dgsw07 on 9/25/24.
//

import SwiftUI

struct SplashScreenView: View {
    var body: some View {
        ZStack {
            Color.color
                .ignoresSafeArea()
            Image("Splash")
                .resizable()
                .edgesIgnoringSafeArea(.all)
                .aspectRatio(contentMode: .fit)
                .frame(width: 180)
                .padding(.bottom,30)
        }
    }
}

#Preview {
    SplashScreenView()
        .environmentObject(ViewModel(user: User(id: "alswn", password: "alswn")))
}
