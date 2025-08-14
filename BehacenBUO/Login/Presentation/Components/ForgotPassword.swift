//
//  ForgotPassword.swift
//  BehacenBUO
//
//  Created by Alexis Lomeli Mejia on 13/08/25.
//

import UIKit

final class ForgotPasswordRowView: UIStackView {
    private let spacer = UIView()
    let button: TextButton

    init(title: String) {
        self.button = TextButton(with: title)
        super.init(frame: .zero)
        axis = .horizontal
        distribution = .fill
        alignment = .fill
        translatesAutoresizingMaskIntoConstraints = false

        addArrangedSubview(spacer)
        addArrangedSubview(button)

        // Spacer expands; button stays compact and right-aligned
        spacer.setContentHuggingPriority(.defaultLow, for: .horizontal)
        spacer.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        button.setContentHuggingPriority(.required, for: .horizontal)
        button.setContentCompressionResistancePriority(.required, for: .horizontal)
    }

    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

#Preview {
    ForgotPasswordRowView(title: "Forgot Password?")
}
