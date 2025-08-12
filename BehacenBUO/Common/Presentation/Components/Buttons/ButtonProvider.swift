//
//  ButtonProvider.swift
//  BehacenBUO
//
//  Created by Alexis Lomeli Mejia on 12/08/25.
//

import UIKit

enum Provider {
    case google, apple
    
    func logo() -> UIImage {
        switch self {
            case .google:
                return UIImage(resource: .googleLogo)
            case .apple:
                return UIImage(systemName: "apple.logo")!
        }
    }
    
    func label() -> String {
        switch self {
            case .google:
                return "Google"
            case .apple:
                return "Apple"
        }
    }
}

class ButtonProvider: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(provider: Provider) {
        self.init(frame: .zero)
        configure(provider: provider)
    }
    
    private func configure(provider: Provider) {
        var configuration = configuration
        configuration = .bordered()
        configuration?.buttonSize = .large
        configuration?.background.strokeColor = .tertiaryLabel
        configuration?.baseBackgroundColor = .systemBackground
        configuration?.imagePadding = 10
        configuration?.cornerStyle = .medium
        configuration?.image = provider.logo()
        configuration?.title = provider.label()
        translatesAutoresizingMaskIntoConstraints = false
        
        self.configuration = configuration
        
    }
}

#Preview {
    ButtonProvider(provider: .apple)
}
