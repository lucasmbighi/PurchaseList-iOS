//
//  Date+ToServerFormat.swift
//  PurchaseList
//
//  Created by Macbook Pro on 30/06/23.
//

import Foundation

extension Date {
    var toServerFormat: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter.string(from: self)
    }
}
