//
//  WelcomeHeader.swift
//  BehacenBUO
//
//  Created by Alexis Lomeli Mejia on 13/08/25.
//

import UIKit

class WelcomeHeader: UIStackView {
    
    let welcomeTitle: TitleLabel = TitleLabel("Welcome back!")
    let logInDescription: SubtitleLabel = SubtitleLabel("Log in to access your saved recipes")

    override init(frame: CGRect) {
        super.init(frame: frame)
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
    WelcomeHeader()
}
