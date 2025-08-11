//
//  BaseScrollView.swift
//  BehacenBUO
//
//  Created by Alexis Lomeli Mejia on 08/08/25.
//

import UIKit

final class ScrollContainerView: UIScrollView {
    let contentView = UIView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }

    private func setup() {
        
        translatesAutoresizingMaskIntoConstraints = false
        addSubview(contentView)
        contentView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: topAnchor),
            contentView.leadingAnchor.constraint(equalTo: leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: bottomAnchor),

            contentView.widthAnchor.constraint(equalTo: widthAnchor)
        ])
    }
}
