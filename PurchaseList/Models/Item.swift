//
//  Item.swift
//  PurchaseList
//
//  Created by Macbook Pro on 27/06/23.
//

import Foundation

struct Item: Codable {
    var id: String = UUID().uuidString
    let name: String
    let quantity: Double
    let unity: Unity
}

extension Item: Equatable, Identifiable {
    var identifier: String { id }
}

extension Item {
    static var mock: [Item] {
        [
            Item(name: "Açucar", quantity: 1, unity: .package),
            Item(name: "Leite", quantity: 1, unity: .box),
            Item(name: "Café", quantity: 1, unity: .package)
        ]
    }
}
