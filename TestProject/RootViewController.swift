//
//  RootViewController.swift
//  TestProject
//
//  Created by Антон Кашников on 15.09.2022.
//

import UIKit

class RootViewController: UIViewController {
    
    private var current: UIViewController
    
    init() {
      self.current = LoginViewController()
      super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addChild(current)
        current.view.frame = view.bounds
        view.addSubview(current.view)
        current.didMove(toParent: self)
    }
    
    func switchToNavigation() {
        let tableVC = TableViewController()
        //tableVC.title = "Table VC"
        let navigationVC = NavigationViewController(rootViewController: tableVC)
    
        current.willMove(toParent: self)
        addChild(navigationVC)
        
        navigationVC.view.frame = view.frame
        view.addSubview(navigationVC.view)
        navigationVC.didMove(toParent: self)
        
        //animateFadeTransition(to: navigationVC)
    }
    
    private func animateFadeTransition(to new: UIViewController, completion: (() -> Void)? = nil) {
        current.willMove(toParent: nil)
        addChild(new)

        transition(from: current, to: new, duration: 0.3, options: [.transitionCrossDissolve, .curveEaseOut], animations: {}) { completed in
            self.current.removeFromParent()
            new.didMove(toParent: self)
            self.current = new
            completion?()
        }
    }
    
    func switchToLogout() {
        let loginViewController = LoginViewController()
        let logoutScreen = UINavigationController(rootViewController: loginViewController)
        animateDismissTransition(to: logoutScreen)
    }
    
    private func animateDismissTransition(to new: UIViewController, completion: (() -> Void)? = nil) {
        current.willMove(toParent: nil)
        addChild(new)
        transition(from: current, to: new, duration: 0.3, options: [], animations: { new.view.frame = self.view.bounds }) { completed in
            self.current.removeFromParent()
            new.didMove(toParent: self)
            self.current = new
            completion?()
        }
    }
}
