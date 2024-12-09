//
//  TookApp.swift
//  Took
//
//  Created by dgsw07 on 9/19/24.
//

import SwiftUI

@main
struct TookApp: App {
    @AppStorage("accessToken")    
    private var accessToken: String?
    @StateObject private var loginViewModel = LoginViewModel()
    var body: some Scene {
        WindowGroup {
                NavigationView {
                    if accessToken == nil {
                        LoginView()
                    } else {
                        MainView()
                    }
                }
            }
        }
    }





