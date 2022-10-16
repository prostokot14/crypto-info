//
//  Coin.swift
//  TestProject
//
//  Created by Антон Кашников on 05.10.2022.
//

struct Coin: Decodable {
    var data: DataCoin?
}

struct DataCoin: Decodable {
    var name: String
    var market_data: MarketData?
}

struct MarketData: Decodable {
    var price_usd: Double
    var percent_change_usd_last_24_hours: Double
}
