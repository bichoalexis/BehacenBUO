//
//  BodyLabel.swift
//  BehacenBUO
//
//  Created by Alexis Lomeli Mejia on 07/08/25.
//

import UIKit

class BodyLabel: UILabel {
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureDefaults()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(_ text: String, textAlignment: NSTextAlignment = .left, textColor: UIColor = .label, fontSize: CGFloat = 18, numberOfLines: Int = 0) {
        self.init(frame: .zero)
        self.textColor = textColor
        self.textAlignment = textAlignment
        self.numberOfLines = numberOfLines
        self.text = text
        font = UIFont.systemFont(ofSize: fontSize, weight: .regular)
        configureDefaults()
    }
    
    private func configureDefaults() {
        self.textColor = textColor
        lineBreakMode = .byTruncatingTail
        numberOfLines = 2
        self.textAlignment = textAlignment
        self.text = text
        translatesAutoresizingMaskIntoConstraints = false
    }

}
