//
//  DontHaveAccount.swift
//  BehacenBUO
//
//  Created by Alexis Lomeli Mejia on 12/08/25.
//

import UIKit

enum FooterType {
    case login, signup
    
    func title() -> String {
        switch self {
            case .login:
                return "Don't have an account?"
            case .signup:
                return "Already have an account?"
        }
    }
    
    func buttonTitle() -> String {
        switch self {
            case .login:
                return "Sign Up"
            case .signup:
                return "Log In"
        }
    }
}

class FooterAuth: UIStackView {
    private(set) var type: FooterType
    private(set) var label: BodyLabel
    private(set) var textButton: TextButton

    init(type: FooterType) {
        self.type = type
        self.label = BodyLabel(type.title(), textColor: .systemGray)
        self.textButton = TextButton(with: type.buttonTitle())
        super.init(frame: .zero)
        configure()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func configure() {
        addArrangedSubview(label)
        addArrangedSubview(textButton)
        axis = .horizontal
        alignment = .center
        spacing = 4
        translatesAutoresizingMaskIntoConstraints = false
        distribution = .fill

        // Mantener los elementos con su tamaño intrínseco y evitar que se estiren horizontalmente
        label.setContentHuggingPriority(.required, for: .horizontal)
        label.setContentCompressionResistancePriority(.required, for: .horizontal)
        textButton.setContentHuggingPriority(.required, for: .horizontal)
        textButton.setContentCompressionResistancePriority(.required, for: .horizontal)
        translatesAutoresizingMaskIntoConstraints = false
    }
}

#Preview {
    FooterAuth(type: .login)
}
