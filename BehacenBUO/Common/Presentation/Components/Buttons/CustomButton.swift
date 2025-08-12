//
//  CustomButton.swift
//  BehacenBUO
//
//  Created by Alexis Lomeli Mejia on 07/08/25.
//

import UIKit

class CustomButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init (with title: String, image: String? = nil) {
        self.init(frame: .zero)
        setUp(with: title, image: image)
    }
    
    func setUp(with title: String, image: String? = nil) {
        configuration = .prominentClearGlass()
        configuration?.baseBackgroundColor = .systemBackground
        configuration?.baseForegroundColor = .label
        configuration?.title = title
        configuration?.image = image == nil ? nil : UIImage(systemName: image!)
        configuration?.imagePlacement = .leading
        configuration?.imagePadding = 10
        configuration?.buttonSize = .large
        translatesAutoresizingMaskIntoConstraints = false
    }
}

#Preview {
    CustomButton(with: "Start Cooking", image: "fork.knife")
}
