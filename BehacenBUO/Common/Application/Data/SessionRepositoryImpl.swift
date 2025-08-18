//
//  SessionRepositoryImpl.swift
//  BehacenBUO
//
//  Created by Alexis Lomeli Mejia on 14/08/25.
//

import Foundation

struct SessionRepositoryImpl: SessionRepository {
    let userDefaults: UserDefaults
    
    init(userDefaults: UserDefaults) {
        self.userDefaults = userDefaults
    }
    
    enum Keys: String, Codable {
        case isLogin = "isLogin"
    }
    
    func getSession() -> Bool {
        userDefaults.bool(forKey: Keys.isLogin.rawValue)
    }
    
    func saveSession(_ isLogin: Bool) {
        userDefaults.set(isLogin, forKey: Keys.isLogin.rawValue)
    }
    
    
}
