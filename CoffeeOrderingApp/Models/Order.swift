//
//  Order.swift
//  CoffeeOrderingApp
//
//  Created by Ivan Ivanov on 10.05.2020.
//  Copyright © 2020 Ivan Ivanov. All rights reserved.
//

import Foundation

struct Order: Codable {
    
    let name: String
    let size: String
    let coffeeName: String
    let total: Double
    
}
