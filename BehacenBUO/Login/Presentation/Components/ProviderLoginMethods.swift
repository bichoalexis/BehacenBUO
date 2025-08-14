//
//  ProviderLoginMethods.swift
//  BehacenBUO
//
//  Created by Alexis Lomeli Mejia on 12/08/25.
//

import UIKit

class ProviderLoginMethods: UIStackView {
    let googleProvider: ButtonProvider = ButtonProvider(provider: .google)
    let appleProvider: ButtonProvider = ButtonProvider(provider: .apple)

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        addArrangedSubview(googleProvider)
        addArrangedSubview(appleProvider)
        axis = .horizontal
        distribution = .fillEqually
        spacing = UIConstants.Spacing.small
        
        translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}

#Preview {
    ProviderLoginMethods()
}
