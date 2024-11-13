//
//  ViewModel.swift
//  Took
//
//  Created by dgsw07 on 9/19/24.
//
import SwiftUI
import Combine

class LoginViewModel: ObservableObject {
    @Published var loginVM: User
    @Published var isLoading = true
    @Published var isLogin = false
    @Published var alertOn = false
    @Published var detailRequest = false
    
    init(user: User, isLoading: Bool = true, isLogin: Bool = false, alertOn: Bool = false, detailRequest: Bool = false) {
        self.loginVM = user
    }
    
    func login(id: String, password: String) {
        if id == loginVM.id && password == loginVM.password {
            isLogin = true
        } else {
            alertOn = true
        }
    }
}
