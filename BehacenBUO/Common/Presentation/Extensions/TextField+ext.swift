//
//  TextField+ext.swift
//  BehacenBUO
//
//  Created by Alexis Lomeli Mejia on 14/08/25.
//

import Foundation
import UIKit
import Combine

extension UITextField {
    
    var textPublisher: AnyPublisher<String, Never> {
        return NotificationCenter.default.publisher(for: UITextField.textDidChangeNotification, object: self).map { notification in
            (notification.object as? UITextField)?.text ?? ""
        }
        .eraseToAnyPublisher()
    }
}
