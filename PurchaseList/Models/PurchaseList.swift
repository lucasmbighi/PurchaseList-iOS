//
//  PurchaseList.swift
//  PurchaseList
//
//  Created by Macbook Pro on 28/06/23.
//

import Foundation

struct PurchaseList: Codable {
    var id: Int?
    let stringDate: String
    let items: [Item]
    
    var itemsDescription: String {
        items.map { $0.name }.joined(separator: ", ")
    }
    
    var formattedDate: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        let date = formatter.date(from: stringDate) ?? .now
        return date.formatted(date: .abbreviated, time: .omitted)
    }
}

extension PurchaseList: Equatable, Identifiable {
    var identifier: String {
        if let id {
            return "\(id)"
        }
        return UUID().uuidString
    }
}

extension PurchaseList {
    static var mock: [PurchaseList] {
        (0...2).map {
            PurchaseList(
                id: $0,
                stringDate: "2019-11-24",
                items: Item.mock
            )
        }
    }
}
