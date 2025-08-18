//
//  DependencyContainer.swift
//  BehacenBUO
//
//  Created by Alexis Lomeli Mejia on 14/08/25.
//

import Foundation
import UIKit

struct DependencyContainer {
    static var shared: DependencyContainer = .init()
    let sessionRepository: SessionRepository
    
    private init() {
        
        self.sessionRepository = SessionRepositoryImpl(userDefaults: UserDefaults.standard)
        self.saveSessionUseCase = SaveSessionUseCase(sessionRepository: sessionRepository)
        self.loginViewModel = LoginViewModel(saveSession: saveSessionUseCase)
        self.loginViewController = LoginViewController(viewModel: loginViewModel)
        self.mainTabViewController = MainTabBarController()
    }
    
    // Usecase
    let saveSessionUseCase: SaveSessionUseCase
    
    // ViewModels
    let loginViewModel: LoginViewModel
    
    // ViewControllers
    let loginViewController: LoginViewController
    let mainTabViewController: MainTabBarController
}
