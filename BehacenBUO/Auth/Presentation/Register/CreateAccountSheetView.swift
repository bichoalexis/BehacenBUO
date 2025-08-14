//
//  CreateAccountSheetView.swift
//  BehacenBUO
//
//  Created by Alexis Lomeli Mejia on 14/08/25.
//

import UIKit

class CreateAccountSheetView: UIStackView {
    let welcomeHeader: AuthHeader = AuthHeader(headerType: .createAccount)
    
    let nameTextField: CustomTextField = CustomTextField(placeHolder: "Name", keyboardType: .default, returnKeyType: .continue)
    let emailTextField: CustomTextField = CustomTextField(placeHolder: "Email", keyboardType: .emailAddress, returnKeyType: .continue)
    let passwordTextField: CustomTextField = CustomTextField(placeHolder: "Password", isSecureTextEntry: true, returnKeyType: .done)
    let loginButton: CustomFlatButton = CustomFlatButton(with: "Log In")
    
    let continueWith: ContinueWithView = ContinueWithView()
    let loginProviders: ProviderLoginMethods = ProviderLoginMethods()
    let dontHaveAccount: FooterAuth = FooterAuth(type: .signup)
    
    private let dontHaveAccountContainer: UIView = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        buildHeirarchy()
        style()
        layout()
    }
    
    private func buildHeirarchy() {
        [welcomeHeader, nameTextField, emailTextField, passwordTextField,
         loginButton, continueWith, loginProviders].forEach { view in
            addArrangedSubview(view)
        }
        dontHaveAccountContainer.translatesAutoresizingMaskIntoConstraints = false
        dontHaveAccountContainer.addSubview(dontHaveAccount)
        addArrangedSubview(dontHaveAccountContainer)
    }
    
    private func style() {
        translatesAutoresizingMaskIntoConstraints = false
        axis = .vertical
        spacing = UIConstants.Spacing.medium
        distribution = .fill
        alignment = .fill
        
        isLayoutMarginsRelativeArrangement = true
        directionalLayoutMargins = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
        
    }
    
    private func layout() {
        dontHaveAccountContainer.setContentHuggingPriority(.defaultLow, for: .vertical)
        dontHaveAccountContainer.setContentHuggingPriority(.defaultLow, for: .vertical)
        
        NSLayoutConstraint.activate([
            dontHaveAccount.leadingAnchor.constraint(greaterThanOrEqualTo:  dontHaveAccountContainer.leadingAnchor),
            dontHaveAccount.trailingAnchor.constraint(lessThanOrEqualTo: dontHaveAccountContainer.trailingAnchor),
            dontHaveAccount.centerXAnchor.constraint(equalTo: dontHaveAccountContainer.centerXAnchor),
            dontHaveAccount.topAnchor.constraint(greaterThanOrEqualTo: dontHaveAccountContainer.topAnchor),
            dontHaveAccount.bottomAnchor.constraint(lessThanOrEqualTo: dontHaveAccountContainer.bottomAnchor),
        ])
    }

}

#Preview {
    CreateAccountSheetView()
}
