    //
    //  ContinueWithView.swift
    //  BehacenBUO
    //
    //  Created by Alexis Lomeli Mejia on 12/08/25.
    //

    import UIKit

    class ContinueWithView: UIView {
        private func makeDivider() -> UIView {
            let view = UIView()
            view.backgroundColor = .systemGray4
            view.layer.cornerRadius = 0.5
            view.translatesAutoresizingMaskIntoConstraints = false
            view.heightAnchor.constraint(equalToConstant: 1).isActive = true
            return view
        }
        
        let label: BodyLabel = BodyLabel("Or continue with", textColor: .systemGray4)
        
        let stackView: UIStackView = {
            let stackView = UIStackView()
            stackView.axis = .horizontal
            stackView.spacing = 16
            stackView.distribution = .fill
            stackView.alignment = .center
            stackView.translatesAutoresizingMaskIntoConstraints = false
            return stackView
        }()

        override init(frame: CGRect) {
            super.init(frame: frame)
            configure()
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        private func configure(){
            addSubview(stackView)
            let leftDivider = makeDivider()
            let rightDivider = makeDivider()

            leftDivider.setContentHuggingPriority(.defaultLow, for: .horizontal)
            leftDivider.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
            rightDivider.setContentHuggingPriority(.defaultLow, for: .horizontal)
            rightDivider.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
            label.setContentHuggingPriority(.required, for: .horizontal)
            label.setContentCompressionResistancePriority(.required, for: .horizontal)
            translatesAutoresizingMaskIntoConstraints = false


            stackView.addArrangedSubview(leftDivider)
            stackView.addArrangedSubview(label)
            stackView.addArrangedSubview(rightDivider)
            
            NSLayoutConstraint.activate([
                leftDivider.widthAnchor.constraint(equalTo: rightDivider.widthAnchor),
                
                stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
                stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
                stackView.centerYAnchor.constraint(equalTo: centerYAnchor)
            ])
        }
        
    }

    #Preview {
        ContinueWithView()
    }
