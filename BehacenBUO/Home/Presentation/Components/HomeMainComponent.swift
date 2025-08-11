    //
    //  HomeMainComponent.swift
    //  BehacenBUO
    //
    //  Created by Alexis Lomeli Mejia on 07/08/25.
    //

    import UIKit

    class HomeMainComponent: UIView {
        let image: UIImageView = UIImageView()
        let title: TitleLabel = TitleLabel()
        let subtitle: SubtitleLabel = SubtitleLabel()
        let mainButtonIconButtonStack: MainButtonWithIconButton = MainButtonWithIconButton()

        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        init(
            frame: CGRect = .zero,
            onButtonTap: Selector? = nil,
            onFavoritesButtonTap: Selector? = nil,
            target: Any? = nil
        ) {
            super.init(frame: frame)
            translatesAutoresizingMaskIntoConstraints = false
            setupImage()
            setupComponentsInImage(onButtonTap: onButtonTap, onFavoritesButtonTap: onFavoritesButtonTap, target: target)
        }
        
        func setupComponentsInImage(onButtonTap: Selector? = nil, onFavoritesButtonTap: Selector? = nil, target: Any? = nil) {
            let title = TitleLabel("Grilled Salmon", textColor: .white)
            let subtitle = SubtitleLabel("BUO recommends", textColor: .white)
            let mainButtonIconButtonStack = MainButtonWithIconButton(onButtonTap: onButtonTap, onFavoritesButtonTap: onFavoritesButtonTap, target: target)
            [title, subtitle, mainButtonIconButtonStack].forEach { view in
                image.addSubview(view)
            }
            
            let padding = UIConstants.Spacing.medium
            let spacing = UIConstants.Spacing.small
            
            NSLayoutConstraint.activate([
                mainButtonIconButtonStack.leadingAnchor.constraint(equalTo: image.leadingAnchor, constant: padding),
                mainButtonIconButtonStack.bottomAnchor.constraint(equalTo: image.bottomAnchor, constant: -padding),
                mainButtonIconButtonStack.trailingAnchor.constraint(equalTo: image.trailingAnchor, constant: -padding),
                
                title.leadingAnchor.constraint(equalTo: image.leadingAnchor, constant: padding),
                title.trailingAnchor.constraint(equalTo: image.trailingAnchor, constant: -padding),
                title.bottomAnchor.constraint(equalTo: mainButtonIconButtonStack.topAnchor, constant: -padding),
                
                subtitle.leadingAnchor.constraint(equalTo: image.leadingAnchor, constant: padding),
                subtitle.trailingAnchor.constraint(equalTo: image.trailingAnchor, constant: -padding),
                subtitle.bottomAnchor.constraint(equalTo: title.topAnchor, constant: -spacing),

            ])
            
            
            
        }
        
        private func setupImage() {
            addSubview(image)
            image.translatesAutoresizingMaskIntoConstraints = false
            
            image.image = UIImage(resource: .salmon)
            image.cornerConfiguration = .corners(radius: .fixed(UIConstants.CornerRadius.card))
            image.contentMode = .scaleAspectFill
            image.clipsToBounds = true
            image.isUserInteractionEnabled = true
            
            NSLayoutConstraint.activate([
                image.topAnchor.constraint(equalTo: topAnchor),
                image.leadingAnchor.constraint(equalTo: leadingAnchor),
                image.trailingAnchor.constraint(equalTo: trailingAnchor),
                image.bottomAnchor.constraint(equalTo: bottomAnchor)
            ])
        }
        
    }

#Preview {
    HomeMainComponent()
}
