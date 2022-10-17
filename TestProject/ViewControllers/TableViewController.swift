//
//  TableViewController.swift
//  TestProject
//
//  Created by Антон Кашников on 21.09.2022.
//

import UIKit

class TableViewController: UIViewController {
    let coinsTableView = UITableView()
    
    let networkService = NetworkService()
    
    var arrayOfCoins: [Coin] = []
    
    var indicator = UIActivityIndicatorView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationBar()
        
        view.addSubview(coinsTableView)
        setupAutoLayout()
        
        doRequest()
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
        navigationItem.title = "Coins"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Sort", style: .done, target: self, action: #selector(sort))
    }
    
    private func setupAutoLayout() {
        coinsTableView.translatesAutoresizingMaskIntoConstraints = false
        
        coinsTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        coinsTableView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor).isActive = true
        coinsTableView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor).isActive = true
        coinsTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        
        coinsTableView.dataSource = self
        coinsTableView.delegate = self
        coinsTableView.register(CoinTableViewCell.self, forCellReuseIdentifier: "coinCell")
    }
    
    func doRequest() {
        let names = ["btc", "eth", "tron", "luna", "polkadot", "dogecoin", "tether", "stellar", "cardano", "xrp"]
        let group = DispatchGroup()
        
        activateIndicator()

        for name in names {
            group.enter()
            let urlString = "https://data.messari.io/api/v1/assets/\(name)/metrics"
            NetworkService.request(urlString: urlString) { [weak self] result in
                switch result {
                case .success(let coin):
                    self?.arrayOfCoins.append(coin)
                    self?.coinsTableView.reloadData()
                    self?.indicator.stopAnimating()
                case .failure(let error):
                    print("error: ", error)
                }
                print("\(name) completed")
                group.leave()
            }
        }
    }
    
    private func activateIndicator() {
        indicator = UIActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        indicator.style = UIActivityIndicatorView.Style.medium
        indicator.center = self.view.center
        self.view.addSubview(indicator)
        indicator.startAnimating()
        indicator.backgroundColor = .white
        indicator.hidesWhenStopped = true
    }
    
    @objc func sort() {
        arrayOfCoins.sort {
            $0.data?.market_data?.percent_change_usd_last_24_hours ?? -1 < $1.data?.market_data?.percent_change_usd_last_24_hours ?? -1
        }
        self.coinsTableView.reloadData()
    }
}
