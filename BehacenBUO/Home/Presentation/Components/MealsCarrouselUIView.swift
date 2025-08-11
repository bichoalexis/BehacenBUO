//
//  MealsCarrouselUIView.swift
//  BehacenBUO
//
//  Created by Alexis Lomeli Mejia on 07/08/25.
//

import UIKit

typealias Resource = (name: String, resource: ImageResource)

class MealsCarrouselUIView: UIView {
    private let scrollView = UIScrollView()
    let resources: [Resource] = [
        (name: "Beef Burger with Melting Cheese Centre", resource: .beefBurger),
        (name: "Hot Cakes with Strawberry", resource: .hotCakes),
        (name: "Milkshake with Chocolate Chips", resource: .milkshake),
        (name: "Pizza with Pepperoni", resource: .pizza)
    ]
    let stackView: UIStackView = UIStackView()

    override init(frame: CGRect) {
        super.init(frame: frame)
       
    }
    
    convenience init(containerWidth: Double){
        self.init(frame: .zero)
        configure(containerWidth: containerWidth)
        configureScrollView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure(containerWidth: Double) {
        translatesAutoresizingMaskIntoConstraints = false
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        stackView.spacing = UIConstants.Spacing.medium
        stackView.axis = .horizontal
        resources.forEach { resource in
            let spendingTime = TimeInterval(Int.random(in: 60...(60*280)))
            let productUIButton = ProductCardView(config: ProductCardView.ProductCardConfiguration(resource: resource.resource, isFavorite: false, spendingTime: spendingTime, caption: resource.name)
            )
            NSLayoutConstraint.activate([
                productUIButton.widthAnchor.constraint(equalToConstant: containerWidth)
            ])
            stackView.addArrangedSubview(productUIButton)
        }
        
        addLateralSpacer()
        addSubview(scrollView)
        scrollView.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.trailingAnchor),
            stackView.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor),

            stackView.heightAnchor.constraint(equalTo: scrollView.frameLayoutGuide.heightAnchor)
        ])
    }
    
    private func addLateralSpacer() {
        if !stackView.arrangedSubviews.isEmpty {
            let leftSpacer = UIView()
            leftSpacer.translatesAutoresizingMaskIntoConstraints = false
            let rightSpacer = UIView()
            rightSpacer.translatesAutoresizingMaskIntoConstraints = false
            
            let space = UIConstants.Spacing.small
            
            NSLayoutConstraint.activate([
                leftSpacer.widthAnchor.constraint(equalToConstant: space),
                rightSpacer.widthAnchor.constraint(equalToConstant: space)
            ])
            
            stackView.insertArrangedSubview(leftSpacer, at: 0)
            stackView.addArrangedSubview(rightSpacer)
        }
    }
    
    private func configureScrollView() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.showsHorizontalScrollIndicator = false
        
        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
            scrollView.topAnchor.constraint(equalTo: topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
        
    }
}

#Preview {
    MealsCarrouselUIView(containerWidth: 500)
}

