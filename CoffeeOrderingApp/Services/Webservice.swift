//
//  Webservice.swift
//  CoffeeOrderingApp
//
//  Created by Ivan Ivanov on 10.05.2020.
//  Copyright © 2020 Ivan Ivanov. All rights reserved.
//

import Foundation

func createCoffeeOrder(order: Order, completion: @escaping(CreateOrderResponse?) -> ()) {
    
    guard let url = URL(string: "https://actually-mire-infinity.glitch.me/orders") else {
        fatalError("Invalid URL")
    }
    
    var request = URLRequest(url: url)
    request.httpMethod = "POST"
    request.addValue("application/json", forHTTPHeaderField: "Content-Type")
    request.httpBody = try? JSONEncoder().encode(order)
    
    URLSession.shared.dataTask(with: request) { data, response, error in
        
        guard let data = data, error == nil else {
            DispatchQueue.main.async {
                completion(nil)
            }
            return
        }
        
        let createOrderResponse = try? JSONDecoder().decode(CreateOrderResponse.self, from: data)
        DispatchQueue.main.async {
            completion(createOrderResponse)
        }
        
    }.resume()
    
}


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
