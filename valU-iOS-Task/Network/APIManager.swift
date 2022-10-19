//
//  APIManager.swift
//  valU-iOS-Task
//
//  Created by Ashraf Essam on 19/10/2022.
//

import UIKit

class APIManager: NSObject {
    
    static let shared = APIManager()
    
    func fetchProductsJSON(completion: @escaping (Result<[Product], Error>) -> ()){
        
        let urlString = Constants.productsUrl
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let err = error {
                completion(.failure(err))
                return
            }
            do {
                let products = try JSONDecoder().decode([Product].self, from: data!)
                completion(.success(products))
            }
            catch let jsonError {
                completion(.failure(jsonError))
            }
        }.resume()
    }
}
