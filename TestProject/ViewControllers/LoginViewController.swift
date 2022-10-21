//
//  LoginViewController.swift
//  TestProject
//
//  Created by Антон Кашников on 15.09.2022.
//

import UIKit

class LoginViewController: UIViewController {
    
    let login = "Qwerty"
    let password = "123456"
    
    private let loginContentView: UIView = {
        let view = UIView()
        view.backgroundColor = .gray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let unameTxtField: UITextField = {
        let txtField = UITextField(placeholder: "Username")
        return txtField
    }()
    
    private let pwordTxtField: UITextField = {
        let txtField = UITextField(placeholder: "Password")
        return txtField
    }()
    
    let btnLogin: UIButton = {
        let btn = UIButton(placeholder: "Log IN")
        btn.addTarget(self, action: #selector(logIn), for: .touchUpInside)
        return btn
    }()
    
    @objc func logIn() {
        if unameTxtField.text == login && pwordTxtField.text == password {
            print("Login success")
            UserDefaults.standard.set(true, forKey: "LOGGED_IN")
            
            let tableVC = TableViewController()
            let navigationVC = NavigationViewController(rootViewController: tableVC)
            
            SceneDelegate.shared.rootViewController = navigationVC
        } else {
            print("ERROR")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if UserDefaults.standard.bool(forKey: "LOGGED_IN") == true {
            let tableVC = TableViewController()
            let navigationVC = NavigationViewController(rootViewController: tableVC)
            
            SceneDelegate.shared.rootViewController = navigationVC
        } else {
            view.backgroundColor = .white
            
            loginContentView.addSubview(unameTxtField)
            loginContentView.addSubview(pwordTxtField)
            loginContentView.addSubview(btnLogin)
            view.addSubview(loginContentView)
            
            setupAutoLayout()
        }
    }
    
    private func setupAutoLayout() {
        loginContentView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        loginContentView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        loginContentView.heightAnchor.constraint(equalToConstant: view.frame.height/3).isActive = true
        loginContentView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        unameTxtField.topAnchor.constraint(equalTo: loginContentView.topAnchor, constant: 40).isActive = true
        unameTxtField.leftAnchor.constraint(equalTo: loginContentView.leftAnchor, constant: 20).isActive = true
        unameTxtField.rightAnchor.constraint(equalTo: loginContentView.rightAnchor, constant: -20).isActive = true
        unameTxtField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        pwordTxtField.leftAnchor.constraint(equalTo: loginContentView.leftAnchor, constant: 20).isActive = true
        pwordTxtField.rightAnchor.constraint(equalTo: loginContentView.rightAnchor, constant: -20).isActive = true
        pwordTxtField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        pwordTxtField.topAnchor.constraint(equalTo: unameTxtField.bottomAnchor, constant: 20).isActive = true
        
        btnLogin.topAnchor.constraint(equalTo: pwordTxtField.bottomAnchor, constant: 20).isActive = true
        btnLogin.leftAnchor.constraint(equalTo: loginContentView.leftAnchor, constant: 20).isActive = true
        btnLogin.rightAnchor.constraint(equalTo: loginContentView.rightAnchor, constant: -20).isActive = true
        btnLogin.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
}
