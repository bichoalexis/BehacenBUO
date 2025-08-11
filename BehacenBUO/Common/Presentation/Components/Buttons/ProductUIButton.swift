//
//  ProductUIButton.swift
//  BehacenBUO
//
//  Created by Alexis Lomeli Mejia on 07/08/25.
//

import UIKit

class ProductUIButton: UIButton {
    var image: UIImageView = UIImageView()
    var timeChip: DefaultChip = DefaultChip()
    var favoritesButton: CustomIconButton = CustomIconButton()

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(resource: ImageResource, isFavorite: Bool, spendingTime: TimeInterval) {
        self.init(frame: .zero)
        configureImage(resource: resource)
        configureImageContent(isFavorite: isFavorite, spendingTime: spendingTime)
    }
    
    private func configureImage(resource: ImageResource){
        image.image = UIImage(resource: resource)
        image.clipsToBounds = true
        image.contentMode = .scaleAspectFill
        image.cornerConfiguration = .corners(radius: .fixed(UIConstants.CornerRadius.card))
        
        image.translatesAutoresizingMaskIntoConstraints = false
        addSubview(image)
       
        
        NSLayoutConstraint.activate([
            image.leadingAnchor.constraint(equalTo: leadingAnchor),
            image.trailingAnchor.constraint(equalTo: trailingAnchor),
            image.topAnchor.constraint(equalTo: topAnchor),
            image.bottomAnchor.constraint(equalTo: bottomAnchor),
            
        ])
        
        
    }
    
    private func configureImageContent(isFavorite: Bool, spendingTime: TimeInterval) {
        favoritesButton = CustomIconButton(with: isFavorite ? "heart.fill" : "heart", iconColor: isFavorite ? .red : .label)
        timeChip = DefaultChip(with: spendingTime.formattedTime())
        
        image.addSubview(favoritesButton)
        image.addSubview(timeChip)
        let padding = UIConstants.Spacing.medium
        
        NSLayoutConstraint.activate([
            favoritesButton.trailingAnchor.constraint(equalTo: image.trailingAnchor, constant: -padding),
            favoritesButton.bottomAnchor.constraint(equalTo: image.bottomAnchor, constant: -padding),
            
            timeChip.leadingAnchor.constraint(equalTo: image.leadingAnchor, constant: padding),
            timeChip.topAnchor.constraint(equalTo: image.topAnchor, constant: padding),
        ])
    }

}

#Preview {
    ProductUIButton(resource: .beefBurger, isFavorite: true, spendingTime: 60*50)
}
