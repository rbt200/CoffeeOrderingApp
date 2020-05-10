//
//  Webservice.swift
//  CoffeeOrderingApp
//
//  Created by Ivan Ivanov on 10.05.2020.
//  Copyright © 2020 Ivan Ivanov. All rights reserved.
//

import Foundation

class Webservice {
    func getAllOrders(completion: @escaping ([Order]?) -> ()) {
        
        guard let url = URL(string: "https://ruby-clover-asphalt.glitch.me/orders") else {
            completion(nil)
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            guard let data = data, error == nil else {
                DispatchQueue.main.async {
                    completion(nil)
                }
                return
            }
            
           let orders = try? JSONDecoder().decode([Order].self, from: data)
            DispatchQueue.main.async {
                completion(orders)
            }
            
            
        }.resume()
        
    }
}
