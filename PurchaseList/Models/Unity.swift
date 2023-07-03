//
//  Unity.swift
//  PurchaseList
//
//  Created by Macbook Pro on 28/06/23.
//

import Foundation

enum Unity: String, Codable, Equatable {
    
    case package, box, bottle
    
    static var allCases: [Unity] {
        [.package, .box, .bottle]
    }
    
    func localizedRawValue(quantity: Double) -> String {
        "\(localizedRawValue)\(quantity != 1 ? "s": "")"
    }
    
    private var localizedRawValue: String {
        switch self {
        case .package:
            return "pacote"
        case .box:
            return "caixa"
        case .bottle:
            return "garrafa"
        }
    }
}

extension Unity: Identifiable {
    var id: String {
        rawValue
    }
}
