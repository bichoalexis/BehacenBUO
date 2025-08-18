//
//  LoginViewModel.swift
//  BehacenBUO
//
//  Created by Alexis Lomeli Mejia on 14/08/25.
//

import Foundation
import Combine

class LoginViewModel {
    @Published var email = ""
    @Published var password = ""
    @Published var loginSuccess: Bool = false
    
    let saveSession: SaveSessionUseCase
    
    init(saveSession: SaveSessionUseCase) {
        self.saveSession = saveSession
    }
    
    func onLoginButton() {
        print(email)
        if email.isEmpty || password.isEmpty {
            print("Error: Missing email or password")
        }
        if email.lowercased() == "bichoalexis@gmail.com" && password == "1234" {
            loginSuccess = true
            saveSession.execute(true)
        }
    }
}
