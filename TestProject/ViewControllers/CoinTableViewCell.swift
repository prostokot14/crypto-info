//
//  CoinTableViewCell.swift
//  TestProject
//
//  Created by Антон Кашников on 06.10.2022.
//

import UIKit

class CoinTableViewCell: UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.contentView.addSubview(nameLabel)
        containerView.addSubview(label1)
        containerView.addSubview(priceLabel)
        containerView.addSubview(label2)
        containerView.addSubview(changeLabel)
        self.contentView.addSubview(containerView)
        self.contentView.addSubview(priceLabel)
        self.contentView.addSubview(changeLabel)
        
        setupAutoLayout()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    var coin: Coin? {
        didSet {
            guard let coinItem = coin else {
                return
            }
            if let name = coinItem.data?.name {
                nameLabel.text = name
            }
            if let price = coinItem.data?.market_data?.price_usd {
               priceLabel.text = "$\(price)"
            }
           
            if let change = coinItem.data?.market_data?.percent_change_usd_last_24_hours {
                changeLabel.text = "\(change)%"
            }
        }
    }
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let label1: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.text = "Current price"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let priceLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.layer.borderWidth = 1
        label.clipsToBounds = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let label2: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.text = "Percent change for last 24 hours"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let changeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.layer.borderWidth = 1
        label.clipsToBounds = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        return view
    }()
    
    private func setupAutoLayout() {
        nameLabel.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 10).isActive = true
        nameLabel.widthAnchor.constraint(equalToConstant: 120).isActive = true
        nameLabel.heightAnchor.constraint(equalToConstant: 70).isActive = true
        
        containerView.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor).isActive = true
        containerView.leadingAnchor.constraint(equalTo: self.nameLabel.trailingAnchor, constant: 10).isActive = true
        containerView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor).isActive = true
        containerView.heightAnchor.constraint(equalToConstant: 160).isActive = true
        
        label1.topAnchor.constraint(equalTo: self.containerView.topAnchor).isActive = true
        label1.leadingAnchor.constraint(equalTo: self.containerView.leadingAnchor).isActive = true
        label1.trailingAnchor.constraint(equalTo: self.containerView.trailingAnchor).isActive = true
        label1.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        priceLabel.topAnchor.constraint(equalTo: self.label1.bottomAnchor).isActive = true
        priceLabel.leadingAnchor.constraint(equalTo: self.containerView.leadingAnchor).isActive = true
        priceLabel.trailingAnchor.constraint(equalTo: self.containerView.trailingAnchor).isActive = true
        priceLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        label2.topAnchor.constraint(equalTo: self.priceLabel.bottomAnchor).isActive = true
        label2.leadingAnchor.constraint(equalTo: self.containerView.leadingAnchor).isActive = true
        label2.trailingAnchor.constraint(equalTo: self.containerView.trailingAnchor).isActive = true
        label2.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        changeLabel.topAnchor.constraint(equalTo: self.label2.bottomAnchor).isActive = true
        changeLabel.leadingAnchor.constraint(equalTo: self.containerView.leadingAnchor).isActive = true
        changeLabel.trailingAnchor.constraint(equalTo: self.containerView.trailingAnchor).isActive = true
        changeLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
}
