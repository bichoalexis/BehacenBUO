//
//  NSNotification+Ext.swift
//  BehacenBUO
//
//  Created by Alexis Lomeli Mejia on 14/08/25.
//

import Foundation

extension NSNotification.Name {
    static let isLoggedIn = NSNotification.Name(SessionStateKey.isLoggedIn.rawValue)
    static let sessionStateChanged = NSNotification.Name("sessionStateChanged")
}
