    //
    //  WelcomeSheetView.swift
    //  BehacenBUO
    //
    //  Created by Alexis Lomeli Mejia on 13/08/25.
    //

    import UIKit

    final class WelcomeSheetView: UIStackView {
        let welcomeHeader: AuthHeader = AuthHeader(headerType: .welcome)
        
        let emailTextField: CustomTextField = CustomTextField(placeHolder: "Email", keyboardType: .emailAddress, returnKeyType: .continue)
        let passwordTextField: CustomTextField = CustomTextField(placeHolder: "Password", isSecureTextEntry: true, returnKeyType: .done)
        let forgotPasswordRow: ForgotPasswordRowView = ForgotPasswordRowView(title: "Forgot Password?")
        let loginButton: CustomFlatButton = CustomFlatButton(with: "Log In")
        
        let continueWith: ContinueWithView = ContinueWithView()
        let loginProviders: ProviderLoginMethods = ProviderLoginMethods()
        let dontHaveAccount: FooterAuth = FooterAuth(type: .login)
        
        private let dontHaveAccountContainer: UIView = UIView()
        
        override init(frame: CGRect) {
            super.init(frame: frame)
            configure()
        }
        
        required init(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        private func configure() {
            buildHierarchy()
            style()
            layout()
        }
        
        // MARK: - Build
        private func buildHierarchy() {
            translatesAutoresizingMaskIntoConstraints = false

            [welcomeHeader, emailTextField, passwordTextField, forgotPasswordRow, loginButton, continueWith, loginProviders].forEach { view in
                addArrangedSubview(view)
            }

            // Add DontHaveAccount container as arranged subview and embed its content
            dontHaveAccountContainer.translatesAutoresizingMaskIntoConstraints = false
            addArrangedSubview(dontHaveAccountContainer)
            dontHaveAccountContainer.addSubview(dontHaveAccount)
        }

        // MARK: - Style
        private func style() {
            translatesAutoresizingMaskIntoConstraints = false
            axis = .vertical
            distribution = .fill
            alignment = .fill
            spacing = UIConstants.Spacing.small

            // Usar márgenes del stack para evitar múltiples constraints de leading/trailing
            isLayoutMarginsRelativeArrangement = true
            directionalLayoutMargins = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)

            // Espaciado mayores
            let spacing = UIConstants.Spacing.large
            setCustomSpacing(spacing, after: welcomeHeader)
            setCustomSpacing(spacing, after: loginButton)
            setCustomSpacing(spacing, after: continueWith)

            // Permitir expansión vertical del contenedor
            dontHaveAccountContainer.setContentHuggingPriority(.defaultLow, for: .vertical)
        }

        // MARK: - Layout
        private func layout() {

            NSLayoutConstraint.activate([
                dontHaveAccount.centerXAnchor.constraint(equalTo: dontHaveAccountContainer.centerXAnchor),
                dontHaveAccount.topAnchor.constraint(greaterThanOrEqualTo: dontHaveAccountContainer.topAnchor),
                dontHaveAccount.bottomAnchor.constraint(lessThanOrEqualTo: dontHaveAccountContainer.bottomAnchor),
                // “Mi borde izquierdo debe estar igual o más a la derecha que el borde izquierdo del contenedor”.
                dontHaveAccount.leadingAnchor.constraint(greaterThanOrEqualTo: dontHaveAccountContainer.leadingAnchor),
                // “Mi borde derecho debe estar igual o más a la izquierda que el borde derecho del contenedor”.
                dontHaveAccount.trailingAnchor.constraint(lessThanOrEqualTo: dontHaveAccountContainer.trailingAnchor)
            ])
        }
    }


    #Preview {
        WelcomeSheetView()
    }
