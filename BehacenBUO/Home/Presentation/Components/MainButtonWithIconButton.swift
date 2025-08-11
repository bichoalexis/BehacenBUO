import UIKit

class MainButtonWithIconButton: UIStackView {
    let button: CustomButton
    let favoritesButton: CustomIconButton

    init(
        buttonTitle: String = "Start Cooking",
        buttonImage: String = "fork.knife",
        favoritesIcon: String = "heart.fill",
        favoritesIconColor: UIColor = .red,
        onButtonTap: Selector? = nil,
        onFavoritesButtonTap: Selector? = nil,
        target: Any? = nil
    ) {
        self.button = CustomButton(with: buttonTitle, image: buttonImage)
        self.favoritesButton = CustomIconButton(with: favoritesIcon, iconColor: favoritesIconColor)
        super.init(frame: .zero)
        setUp(onButtonTap: onButtonTap, onFavoritesButtonTap: onFavoritesButtonTap, target: target)
    }

    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setUp(onButtonTap: Selector?, onFavoritesButtonTap: Selector?, target: Any?) {
        axis = .horizontal
        spacing = UIConstants.Spacing.small
        alignment = .center
        distribution = .fill
        translatesAutoresizingMaskIntoConstraints = false

        // Añade los botones al stack
        addArrangedSubview(button)
        addArrangedSubview(favoritesButton)

        // Ajusta las prioridades para que button se expanda
        button.setContentHuggingPriority(.defaultLow, for: .horizontal)
        favoritesButton.setContentHuggingPriority(.required, for: .horizontal)
        button.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        favoritesButton.setContentCompressionResistancePriority(.required, for: .horizontal)

        // agregar targets
        if let onButtonTap = onButtonTap {
            button.addTarget(target, action: onButtonTap, for: .touchUpInside)
        }
        if let onFavoritesButtonTap = onFavoritesButtonTap {
            favoritesButton.addTarget(target, action: onFavoritesButtonTap, for: .touchUpInside)
        }
    }
}

#Preview {
    MainButtonWithIconButton(
        buttonTitle: "Preview Button",
        buttonImage: "flame.fill",
        favoritesIcon: "star.fill",
        favoritesIconColor: .systemYellow
    )
}
