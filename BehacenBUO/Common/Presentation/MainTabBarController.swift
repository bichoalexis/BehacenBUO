//
//  MainTabBarController.swift
//  BehacenBUO
//
//  Created by Alexis Lomeli Mejia on 07/08/25.
//

import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        UITabBar.appearance().tintColor = .systemRed
        viewControllers = [generateHomeViewController(), generateSearchViewController(), generateMyRecipesViewController(), generateShoppingViewController(), generateAccountViewController()]
    }
    
    func generateHomeViewController() -> UINavigationController {
        let homeViewController = HomeViewController()
        homeViewController.tabBarItem.title = "Home"
        homeViewController.tabBarItem.image = UIImage(systemName: "house")
        return UINavigationController(rootViewController: homeViewController)
    }
    
    func generateSearchViewController() -> UINavigationController {
        let searchViewcontroller = SearchViewController()
        searchViewcontroller.tabBarItem = .init(tabBarSystemItem: .search, tag: 1)
        return UINavigationController(rootViewController: searchViewcontroller)
    }
    
    func generateMyRecipesViewController() -> UINavigationController {
        let myRecipesViewController = MyRecipesViewController()
        myRecipesViewController.tabBarItem.title = "My Recipes"
        myRecipesViewController.tabBarItem.image = UIImage(systemName: "book")
        return UINavigationController(rootViewController: myRecipesViewController)
    }
    
    func generateShoppingViewController() -> UINavigationController {
        let shoppingViewController = ShoppingViewController()
        shoppingViewController.tabBarItem.title = "Shopping"
        shoppingViewController.tabBarItem.image = UIImage(systemName: "cart")
        return UINavigationController(rootViewController: shoppingViewController)
    }
    
    func generateAccountViewController() -> UINavigationController {
        let accountViewController = AccountViewController()
        accountViewController.tabBarItem.title = "Account"
        accountViewController.tabBarItem.image = UIImage(systemName: "person")
        return UINavigationController(rootViewController: accountViewController)
    }
    

    

}
