//
//  NetworkService.swift
//  TestProject
//
//  Created by Антон Кашников on 11.10.2022.
//

import Foundation

class NetworkService {
    func request(urlString: String, completion: @escaping (Result<Coin, Error>) -> Void) {
        guard let url = URL(string: urlString) else {
            return
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
            DispatchQueue.main.async {
                if let error = error {
                    print("Some error")
                    completion(.failure(error))
                    return
                }
                guard let data = data else {
                    return
                }
                do {
                    let coin = try JSONDecoder().decode(Coin.self, from: data)
                    completion(.success(coin))
                } catch let jsonError {
                    print("Failed to decode JSON", jsonError)
                    completion(.failure(jsonError))
                }
            }
        }.resume()
    }
}
