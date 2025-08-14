//
//  CustomTextField.swift
//  BehacenBUO
//
//  Created by Alexis Lomeli Mejia on 12/08/25.
//

import UIKit

class CustomTextField: UITextField {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(placeHolder: String, keyboardType: UIKeyboardType = .default, isSecureTextEntry: Bool = false, returnKeyType: UIReturnKeyType = .default, rightView: UIView? = nil) {
        self.init(frame: .zero)
        self.keyboardType = keyboardType
        self.placeholder = placeHolder
        self.isSecureTextEntry = isSecureTextEntry
        self.returnKeyType = returnKeyType
        self.rightView = rightView
        rightViewMode = rightView != nil ? .always : .never
    }
    
    private func configure() {
        borderStyle = .none
        layer.cornerRadius = UIConstants.CornerRadius.button
        layer.borderWidth = 1
        layer.borderColor = UIColor.systemGray4.cgColor
        clipsToBounds = true
        contentMode = .scaleAspectFit
        autocorrectionType = .no
        autocapitalizationType = .none
       }
    
    
        // MARK: - Spacing
        var horizontalPadding: CGFloat = 12
        var interItemSpacing: CGFloat = 8
        var verticalPadding: CGFloat = 8

        private func insetRect(_ bounds: CGRect) -> CGRect {
            var rect = bounds.inset(by: UIEdgeInsets(
                top: verticalPadding, left: horizontalPadding,
                bottom: verticalPadding, right: horizontalPadding
            ))

            if let _ = leftView, leftViewMode != .never {
                let lvWidth = leftViewRect(forBounds: bounds).width
                rect.origin.x += (lvWidth + interItemSpacing)
                rect.size.width -= (lvWidth + interItemSpacing)
            }
            if let _ = rightView, rightViewMode != .never {
                let rvWidth = rightViewRect(forBounds: bounds).width
                rect.size.width -= (rvWidth + interItemSpacing)
            }
            return rect
        }

        override func textRect(forBounds bounds: CGRect) -> CGRect { insetRect(bounds) }
        override func editingRect(forBounds bounds: CGRect) -> CGRect { insetRect(bounds) }

        // Hace que el rightView se ajuste a la altura actual del textfield
        override func rightViewRect(forBounds bounds: CGRect) -> CGRect {
            let targetHeight = max(0, bounds.height - (verticalPadding * 2))
            let width: CGFloat = {
                if let rv = rightView {
                    let w = rv.intrinsicContentSize.width
                    if w > 0 { return w }
                    if rv.bounds.width > 0 { return rv.bounds.width }
                }
                return targetHeight
            }()

            var rect = CGRect.zero
            rect.size = CGSize(width: width, height: targetHeight)
            rect.origin.x = bounds.width - horizontalPadding - rect.width
            rect.origin.y = (bounds.height - rect.height) / 2
            return rect
        }
    
}

#Preview {
    CustomTextField(placeHolder: "Email 2", rightView: CustomIconButton(with: "eye.slash"))
}
