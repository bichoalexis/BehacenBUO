//
//  GetSessionUseCase.swift
//  BehacenBUO
//
//  Created by Alexis Lomeli Mejia on 14/08/25.
//

import Foundation

struct SaveSessionUseCase {
    let sessionRepository: SessionRepository
    
    func execute(_ isLoggedIn: Bool) -> Void {
        sessionRepository.saveSession(isLoggedIn)
        NotificationCenter.default.post(name: .isLoggedIn, object: nil)
    }
}
