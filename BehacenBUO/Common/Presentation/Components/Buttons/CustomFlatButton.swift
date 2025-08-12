//
//  CustomFlatButton.swift
//  BehacenBUO
//
//  Created by Alexis Lomeli Mejia on 12/08/25.
//

import UIKit

class CustomFlatButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: .zero)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(with title: String) {
        self.init(frame: .zero)
        configuration?.title = title
    }
    
    private func configure() {
        var configuration = configuration
        configuration = .filled()
        configuration?.buttonSize = .large
        configuration?.cornerStyle = .large
        configuration?.baseForegroundColor = .white
        configuration?.baseBackgroundColor = .systemRed
        
        self.configuration = configuration
    }

}

#Preview {
    CustomFlatButton(with: "Log in")
}
