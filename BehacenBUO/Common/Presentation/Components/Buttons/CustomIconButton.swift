//
//  CustomIconButton.swift
//  BehacenBUO
//
//  Created by Alexis Lomeli Mejia on 07/08/25.
//

import UIKit

class CustomIconButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init (with systemImage: String, iconColor: UIColor = .label) {
        self.init(frame: .zero)
        setUp(with: systemImage, iconColor: iconColor)
    }
    
    private func setUp(with systemImage: String, iconColor: UIColor) {
        configuration = .prominentGlass()
        configuration?.imagePlacement = .all
        configuration?.baseBackgroundColor = .systemBackground
        configuration?.baseForegroundColor = iconColor
        configuration?.image = UIImage(systemName: systemImage)
        configuration?.buttonSize = .large
        translatesAutoresizingMaskIntoConstraints = false
    }
}

#Preview {
    CustomIconButton(with: "heart.fill", iconColor: .red)
}
