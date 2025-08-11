    //
    //  HomeViewController.swift
    //  BehacenBUO
    //
    //  Created by Alexis Lomeli Mejia on 07/08/25.
    //


import UIKit

class HomeViewController: UIViewController {
    var mainComponent: HomeMainComponent = HomeMainComponent()
    let scrollContainer = ScrollContainerView()
    var mealsCarrouselView = MealsCarrouselUIView()
    var justForYouHeaderView = HeaderActionView()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        configureScrollContainer()
        configureMainComponent()
        configureForYouHeader()
        configureMealsCarrousel()
    }
        
        private func configureView() {
            view.backgroundColor = .systemBackground
            navigationItem.title = "Hello, Hellen!"
            navigationController?.navigationBar.isTranslucent = true
            navigationItem.rightBarButtonItem = UIBarButtonItem(
                image: UIImage(systemName: "bell.fill"),
                style: .plain,
                target: self,
                action: nil
            )
        }
        
    private func configureScrollContainer() {
        view.addSubview(scrollContainer)
        scrollContainer.contentInsetAdjustmentBehavior = .never
        NSLayoutConstraint.activate([
            scrollContainer.topAnchor.constraint(equalTo: view.topAnchor),
            scrollContainer.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollContainer.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollContainer.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    

    private func configureMainComponent() {
        self.mainComponent = HomeMainComponent(onButtonTap: #selector(onTap), onFavoritesButtonTap: #selector(onTap))
        
        scrollContainer.contentView.addSubview(mainComponent)
        
        NSLayoutConstraint.activate([
            mainComponent.leadingAnchor.constraint(equalTo: scrollContainer.contentView.leadingAnchor),
            mainComponent.trailingAnchor.constraint(equalTo: scrollContainer.contentView.trailingAnchor),
            mainComponent.topAnchor.constraint(equalTo: scrollContainer.contentView.topAnchor),
            mainComponent.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.6)
        ])
    }
    
    private func configureForYouHeader(){
        self.justForYouHeaderView = HeaderActionView(with: "Just for You")
        scrollContainer.contentView.addSubview(justForYouHeaderView)
        
        let spacing = UIConstants.Spacing.medium
        
        NSLayoutConstraint.activate([
            justForYouHeaderView.leadingAnchor.constraint(equalTo: scrollContainer.contentView.leadingAnchor, constant: spacing),
            justForYouHeaderView.trailingAnchor.constraint(equalTo: scrollContainer.contentView.trailingAnchor, constant: -spacing),
            justForYouHeaderView.topAnchor.constraint(equalTo: mainComponent.bottomAnchor, constant: spacing),
            
        ])
    }
    
    private func configureMealsCarrousel(){
        self.mealsCarrouselView = MealsCarrouselUIView(containerWidth: 300)
        scrollContainer.contentView.addSubview(mealsCarrouselView)
        
        let spacing = UIConstants.Spacing.medium

        NSLayoutConstraint.activate([
            mealsCarrouselView.leadingAnchor.constraint(equalTo: scrollContainer.contentView.leadingAnchor),
            mealsCarrouselView.trailingAnchor.constraint(equalTo: scrollContainer.contentView.trailingAnchor),
            mealsCarrouselView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.4),
            mealsCarrouselView.topAnchor.constraint(equalTo: justForYouHeaderView.bottomAnchor, constant: spacing),

            // Close the scroll content
            scrollContainer.contentView.bottomAnchor.constraint(equalTo: mealsCarrouselView.bottomAnchor, constant: spacing * 6)
        ])
    }
        
        @objc func onTap(){
            print("tapped")
        }
    }

    #Preview {
        HomeViewController()
    }

