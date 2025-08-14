    //
    //  LoginViewController.swift
    //  BehacenBUO
    //
    //  Created by Alexis Lomeli Mejia on 12/08/25.
    //

    import UIKit

class LoginViewController: UIViewController {
    private let appTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = UIFont.preferredFont(forTextStyle: .extraLargeTitle)
        label.text = "BUO"
        return label
    }()
    private let sheetContainer: UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = .systemBackground
        v.layer.cornerRadius = UIConstants.CornerRadius.card
        v.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        v.layer.masksToBounds = false
        return v
    }()
    let welcomeSheetView = WelcomeSheetView()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemGroupedBackground

        view.addSubview(appTitleLabel)
        NSLayoutConstraint.activate([
            appTitleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            appTitleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: -8)
        ])

        view.addSubview(sheetContainer)
        sheetContainer.addSubview(welcomeSheetView)
        welcomeSheetView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            sheetContainer.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            sheetContainer.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            sheetContainer.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            sheetContainer.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.8),
        ])

        let horizontalSpacing = UIConstants.Spacing.medium
        NSLayoutConstraint.activate([
            welcomeSheetView.leadingAnchor.constraint(equalTo: sheetContainer.safeAreaLayoutGuide.leadingAnchor, constant: horizontalSpacing),
            welcomeSheetView.trailingAnchor.constraint(equalTo: sheetContainer.safeAreaLayoutGuide.trailingAnchor, constant: -horizontalSpacing),
            welcomeSheetView.topAnchor.constraint(equalTo: sheetContainer.safeAreaLayoutGuide.topAnchor, constant: UIConstants.Spacing.large),
            welcomeSheetView.bottomAnchor.constraint(equalTo: sheetContainer.safeAreaLayoutGuide.bottomAnchor)
        ])
    }


        @objc func onTap(_ sender: UIButton) {
            print("Tapped")
        }
    }

    #Preview {
        LoginViewController()
    }
