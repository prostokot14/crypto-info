//
//  DetailViewController.swift
//  TestProject
//
//  Created by Антон Кашников on 06.10.2022.
//

import UIKit

class DetailViewController: UIViewController {
    
    let coin: Coin?
    
    init(coin: Coin?) {
        self.coin = coin
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .gray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let label1: UILabel = {
        let label = UILabel()
        label.backgroundColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        return label
    }()
    
    private let label2: UILabel = {
        let label = UILabel()
        label.backgroundColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.text = "I'm a test label"
        return label
    }()
    
    private let label3: UILabel = {
        let label = UILabel()
        label.backgroundColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.text = "I'm a test label"
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemMint
        
        setupNavigationBar()
        
        containerView.addSubview(label1)
        containerView.addSubview(label2)
        containerView.addSubview(label3)
        view.addSubview(containerView)
        
        setupAutoLayout()
    }
    
    private func setupNavigationBar() {
        if #available(iOS 13.0, *) {
            let navBarAppearance = UINavigationBarAppearance()
            navBarAppearance.configureWithOpaqueBackground()
            navBarAppearance.backgroundColor = .systemBlue
            self.navigationController?.navigationBar.standardAppearance = navBarAppearance
            self.navigationController?.navigationBar.scrollEdgeAppearance = navBarAppearance
        } else {
            self.navigationController?.edgesForExtendedLayout = []
        }
        
        navigationController?.navigationBar.tintColor = .black
        navigationItem.title = coin?.data?.name
        navigationItem.largeTitleDisplayMode = .never
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Log Out", style: .done, target: self, action: #selector(logOut))
    }
    
    private func setupAutoLayout() {
        containerView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        containerView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        containerView.heightAnchor.constraint(equalToConstant: view.frame.height/3).isActive = true
        containerView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        label1.text = "Name of the coin: \(coin?.data?.name ?? "?")"
        label1.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 40).isActive = true
        label1.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 20).isActive = true
        label1.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: -20).isActive = true
        label1.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        label2.text = "Current price of the coin: $\(coin?.data?.market_data?.price_usd ?? -1)"
        label2.topAnchor.constraint(equalTo: label1.bottomAnchor, constant: 20).isActive = true
        label2.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 20).isActive = true
        label2.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: -20).isActive = true
        label2.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        label3.text = "Change of the coin: \(coin?.data?.market_data?.percent_change_usd_last_24_hours ?? -1)%"
        label3.topAnchor.constraint(equalTo: label2.bottomAnchor, constant: 20).isActive = true
        label3.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 20).isActive = true
        label3.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: -20).isActive = true
        label3.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    @objc func logOut() {
        UserDefaults.standard.set(false, forKey: "LOGGED_IN")
        
        let loginVC = LoginViewController()
        SceneDelegate.shared.rootViewController = loginVC
    }
}
