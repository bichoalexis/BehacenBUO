//
//  TextButton.swift
//  BehacenBUO
//
//  Created by Alexis Lomeli Mejia on 12/08/25.
//

import UIKit

class TextButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(with title: String) {
        super.init(frame: .zero)
        var config = UIButton.Configuration.plain()
        config.title = title
        super.configuration = config
        configure()
    }
    
    private func configure(){
        translatesAutoresizingMaskIntoConstraints = false
        
        var configuration = configuration
        configuration?.baseForegroundColor = .red
        
        self.configuration = configuration
    }
    
}

#Preview {
    TextButton(with: "Hello World")
}
