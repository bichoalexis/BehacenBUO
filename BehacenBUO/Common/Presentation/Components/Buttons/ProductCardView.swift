//
//  ProductCardView.swift
//  BehacenBUO
//
//  Created by Alexis Lomeli Mejia on 08/08/25.
//

import Foundation
import UIKit

final class ProductCardView: UIView {
    private let vStack = UIStackView()
    let productButton: ProductUIButton
    private let captionLabel = BodyLabel("", textAlignment: .left)

    struct ProductCardConfiguration {
        let resource: ImageResource
        let isFavorite: Bool
        let spendingTime: TimeInterval
        let caption: String?
    }

    init(config: ProductCardConfiguration) {
        self.productButton = ProductUIButton(
            resource: config.resource,
            isFavorite: config.isFavorite,
            spendingTime: config.spendingTime
        )
        super.init(frame: .zero)
        setup()
        apply(config)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setup() {
        vStack.axis = .vertical
        vStack.spacing = UIConstants.Spacing.small
        vStack.translatesAutoresizingMaskIntoConstraints = false
        addSubview(vStack)

        captionLabel.numberOfLines = 2

        vStack.addArrangedSubview(productButton)
        vStack.addArrangedSubview(captionLabel)

        NSLayoutConstraint.activate([
            vStack.topAnchor.constraint(equalTo: topAnchor),
            vStack.leadingAnchor.constraint(equalTo: leadingAnchor),
            vStack.trailingAnchor.constraint(equalTo: trailingAnchor),
            vStack.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            productButton.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.85)
        ])
    }

    func apply(_ config: ProductCardConfiguration) {
        captionLabel.text = config.caption
        captionLabel.isHidden = (config.caption?.isEmpty ?? true)
    }
}
