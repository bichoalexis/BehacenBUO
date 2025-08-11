//
//  HomeViewController.swift
//  BehacenBUO
//
//  Created by Alexis Lomeli Mejia on 07/08/25.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
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

}

#Preview {
    HomeViewController()
}
