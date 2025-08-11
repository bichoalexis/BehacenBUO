//
//  SubtitleLabel.swift
//  BehacenBUO
//
//  Created by Alexis Lomeli Mejia on 07/08/25.
//

import UIKit

class SubtitleLabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureDefaults()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(_ text: String, textAlignment: NSTextAlignment = .left, textColor: UIColor = .secondaryLabel) {
        super.init(frame: .zero)
        font = UIFont.systemFont(ofSize: 16, weight: .regular)
        self.textColor = textColor
        lineBreakMode = .byTruncatingTail
        numberOfLines = 2
        self.textAlignment = textAlignment
        self.text = text
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func configureDefaults() {
        font = UIFont.systemFont(ofSize: 16, weight: .regular)
        self.textColor = .secondaryLabel
        lineBreakMode = .byTruncatingTail
        numberOfLines = 2
        self.textAlignment = .left
        translatesAutoresizingMaskIntoConstraints = false
    }
}

#Preview {
    SubtitleLabel("Grilled Salmon wqefqwef wef qwef qwef qwf qwef qwefqwef", textAlignment: .center)
}
