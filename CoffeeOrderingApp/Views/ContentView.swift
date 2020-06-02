//
//  ContentView.swift
//  CoffeeOrderingApp
//
//  Created by Ivan Ivanov on 10.05.2020.
//  Copyright © 2020 Ivan Ivanov. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
   @ObservedObject private var orderListVM = OrderListViewModel()
    
    var body: some View {
        
        NavigationView {
            
            OrderListView(orders: self.orderListVM.orders)
            .navigationBarTitle("Coffee Orders")
            
        }
    
        
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
