//
//  NavigationViewController.swift
//  TestProject
//
//  Created by Антон Кашников on 15.09.2022.
//

import UIKit

class NavigationViewController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //self.navigationBar.backgroundColor = .lightGray
    }
    
//    private func generateNavigationController(rootViewController: UIViewController, title: String, image: UIImage) -> UIViewController {
//        let navigationVC = UINavigationController(rootViewController: rootViewController)
//        navigationVC.tabBarItem.title = title
//        navigationVC.tabBarItem.image = image
//        return navigationVC
//    }
    
//    private func setUpNavigationBar() {
//        let titleLabel = UILabel()
//        titleLabel.text = "TEST"
//        titleLabel.font = UIFont.systemFont(ofSize: 15, weight: .medium)
//        titleLabel.textColor = .systemBlue //UIColor(red: 128, green: 127, blue: 127, alpha: 1)
//
//        navigationItem.leftBarButtonItem = UIBarButtonItem.init(customView: titleLabel)
//        navigationController?.navigationBar.backgroundColor = .lightGray
//
//        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Log Out", style: .done, target: self, action: #selector(logOut))
//    }
    
//    @objc func logOut() {
//        let rootViewController = SceneDelegate.shared.rootViewController as? RootViewController
//        rootViewController?.switchToLogout()
//
//        UserDefaults.standard.set(false, forKey: "LOGGED_IN")
//    }
}
