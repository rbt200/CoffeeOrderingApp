//
//  CoffeeViewModel.swift
//  CoffeeOrderingApp
//
//  Created by Ivan Ivanov on 04.06.2020.
//  Copyright © 2020 Ivan Ivanov. All rights reserved.
//

import Foundation

class CoffeeListViewModel {
    
    var coffeeList: [CoffeeViewModel] = [CoffeeViewModel]()
    
}

struct CoffeeViewModel {
    
    var coffee: Coffee
    
    init(coffee: Coffee) {
        self.coffee = coffee
    }
    
    var name: String {
        return self.coffee.name
    }
    
    var imageURL: String {
        return self.coffee.imageURL
    }
    
    var price: Double {
        return self.coffee.price
    }
    
}
