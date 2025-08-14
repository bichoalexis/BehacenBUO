    //
    //  DontHaveAccount.swift
    //  BehacenBUO
    //
    //  Created by Alexis Lomeli Mejia on 12/08/25.
    //

    import UIKit

    class DontHaveAccount: UIStackView {
        let label: BodyLabel = BodyLabel("Don't have an account?", textColor: .systemGray)
        let textButton: TextButton = TextButton(with: "Sign Up")

        override init(frame: CGRect) {
            super.init(frame: frame)
            configure()
        }
        
        required init(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        
        private func configure() {
            addArrangedSubview(label)
            addArrangedSubview(textButton)
            axis = .horizontal
            alignment = .center
            spacing = 4
            translatesAutoresizingMaskIntoConstraints = false
            distribution = .fill

            // Mantener los elementos con su tamaño intrínseco y evitar que se estiren horizontalmente
            label.setContentHuggingPriority(.required, for: .horizontal)
            label.setContentCompressionResistancePriority(.required, for: .horizontal)
            textButton.setContentHuggingPriority(.required, for: .horizontal)
            textButton.setContentCompressionResistancePriority(.required, for: .horizontal)
            translatesAutoresizingMaskIntoConstraints = false
        }
    }

    #Preview {
        DontHaveAccount()
    }
