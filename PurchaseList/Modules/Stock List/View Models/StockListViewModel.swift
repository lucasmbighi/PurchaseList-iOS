//
//  StockListViewModel.swift
//  PurchaseList
//
//  Created by Macbook Pro on 27/06/23.
//

import Foundation

class StockListViewModel: ObservableObject {
    
    @Published var stockItems: [Item]
    
    init(stockItems: [Item] = [Item]()) {
        self.stockItems = stockItems
    }
    
    func fetchItems() {
        
    }
    
    func save(_ item: Item) {
        
    }
    
    func update(_ item: Item) {
        
    }
    
    func delete(_ item: Item) {
        
    }
}
