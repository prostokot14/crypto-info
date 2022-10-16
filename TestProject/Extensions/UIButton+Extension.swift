//
//  UIButton+Extension.swift
//  TestProject
//
//  Created by Антон Кашников on 19.09.2022.
//

import UIKit

extension UIButton {
    public convenience init(placeholder: String) {
        self.init()
        
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = .blue
        self.setTitle("Login", for: .normal)
        self.tintColor = .white
        self.layer.cornerRadius = 5
        self.clipsToBounds = true
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
