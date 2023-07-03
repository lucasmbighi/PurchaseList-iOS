//
//  NewItemViewModel.swift
//  PurchaseList
//
//  Created by Macbook Pro on 28/06/23.
//

import Foundation

class NewItemViewModel: ObservableObject {
    
    @Published var name: String
    @Published var quantity: Double
    @Published var unity: Unity
    
    init(item: Item? = nil) {
        self.name = item?.name ?? ""
        self.quantity = item?.quantity ?? 0
        self.unity = item?.unity ?? .package
    }
    
    var newItem: Item {
        Item(name: name, quantity: quantity, unity: unity)
    }
}
