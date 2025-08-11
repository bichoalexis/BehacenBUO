//
//  HeaderActionView.swift
//  BehacenBUO
//
//  Created by Alexis Lomeli Mejia on 08/08/25.
//

import UIKit

class HeaderActionView: UIStackView {
    let actionButton: UIButton = UIButton()
    var headerTitle: TitleLabel = TitleLabel()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(with title: String, buttonTitle: String = "See all") {
        self.init(frame: .zero)
        configureLabel(with: title)
        configureButton(with: buttonTitle)
        configure()
    }
    
    private func configure(){
        axis = .horizontal
        alignment = .center
        distribution = .fill
        
        translatesAutoresizingMaskIntoConstraints = false
        addArrangedSubview(headerTitle)
        addArrangedSubview(actionButton)
        
        headerTitle.setContentHuggingPriority(.defaultLow, for: .horizontal)
        actionButton.setContentHuggingPriority(.required, for: .horizontal)
        headerTitle.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        actionButton.setContentCompressionResistancePriority(.required, for: .horizontal)
        
        
    }
    
    private func configureButton(with title: String){
        actionButton.translatesAutoresizingMaskIntoConstraints = false
        
        var configuration = actionButton.configuration
        configuration = .plain()
        configuration?.title = title
        configuration?.baseForegroundColor = .red
        
        actionButton.configuration = configuration
    }
    
    private func configureLabel(with text: String){
        self.headerTitle = TitleLabel(text, textAlignment: .left, fontSize: 18)
    }

}

#Preview {
    HeaderActionView(with: "Just for you", buttonTitle: "See all")
}
