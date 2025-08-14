//
//  WelcomeHeader.swift
//  BehacenBUO
//
//  Created by Alexis Lomeli Mejia on 13/08/25.
//

import UIKit

enum HeaderType {
    case welcome, createAccount
    
    func title() -> String {
        switch self {
            case .welcome:
                return "Welcome back!"
            case .createAccount:
                return "Create your account"
        }
    }
    
    func description() -> String {
        switch self {
            case .welcome:
                return "Log in to access your saved recipes"
            case .createAccount:
                return "Save, share, and discover recipes you love."
        }
    }
}

class AuthHeader: UIStackView {
    let headerType: HeaderType
    let welcomeTitle: TitleLabel
    let logInDescription: SubtitleLabel
    
    init(headerType: HeaderType) {
        self.headerType = headerType
        self.welcomeTitle = TitleLabel(headerType.title())
        self.logInDescription = SubtitleLabel( headerType.description())
        super.init(frame: .zero)
        configure()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        addArrangedSubview(welcomeTitle)
        addArrangedSubview(logInDescription)
        
        axis = .vertical
        spacing = UIConstants.Spacing.small
        alignment = .center
        translatesAutoresizingMaskIntoConstraints = false
    }
    
}

#Preview {
    AuthHeader(headerType: .createAccount)
}
