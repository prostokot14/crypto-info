//
//  UITextField+Extension.swift
//  TestProject
//
//  Created by Антон Кашников on 19.09.2022.
//

import UIKit

extension UITextField {
    public convenience init(placeholder: String) {
        self.init()
        
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = .white
        self.placeholder = placeholder
        self.borderStyle = .roundedRect
    }
}
