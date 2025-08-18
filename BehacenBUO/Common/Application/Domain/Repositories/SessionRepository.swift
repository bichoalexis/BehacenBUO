//
//  UserDefaultsManagerProtocol.swift
//  BehacenBUO
//
//  Created by Alexis Lomeli Mejia on 14/08/25.
//

import Foundation

protocol SessionRepository {
    func getSession() -> Bool
    func saveSession(_ isLogin: Bool)
}
