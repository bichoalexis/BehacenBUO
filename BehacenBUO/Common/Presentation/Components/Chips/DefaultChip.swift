//
//  DefaultChip.swift
//  BehacenBUO
//
//  Created by Alexis Lomeli Mejia on 07/08/25.
//

import UIKit

class DefaultChip: UIView {
    
    let glassEffect: UIVisualEffectView = UIVisualEffectView(effect: UIGlassEffect(style: .regular))
    var textLabel: BodyLabel = BodyLabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(with text: String) {
        self.init(frame: .zero)
        configure(with: text)
    }
    
    
    private func configure(with text: String){
        glassEffect.effect = UIGlassEffect(style: .regular)
        glassEffect.cornerConfiguration = .capsule()
        glassEffect.translatesAutoresizingMaskIntoConstraints = false
        
        textLabel = BodyLabel(text, textAlignment: .center)
        textLabel.numberOfLines = 1
        
        addSubview(glassEffect)
        glassEffect.contentView.addSubview(textLabel)
        translatesAutoresizingMaskIntoConstraints = false
        
        let spacing = UIConstants.Spacing.small
        
        NSLayoutConstraint.activate([
                glassEffect.leadingAnchor.constraint(equalTo: leadingAnchor),
                glassEffect.trailingAnchor.constraint(equalTo: trailingAnchor),
                glassEffect.topAnchor.constraint(equalTo: topAnchor),
                glassEffect.bottomAnchor.constraint(equalTo: bottomAnchor),

                textLabel.leadingAnchor.constraint(equalTo: glassEffect.leadingAnchor, constant: spacing),
                textLabel.trailingAnchor.constraint(equalTo: glassEffect.trailingAnchor, constant: -spacing),
                textLabel.topAnchor.constraint(equalTo: glassEffect.topAnchor, constant: spacing),
                textLabel.bottomAnchor.constraint(equalTo: glassEffect.bottomAnchor, constant: -spacing)
        ])
        
    }
}

#Preview {
    DefaultChip(with: "Hello from a chip")
}
