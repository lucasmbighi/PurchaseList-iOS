//
//  NewPurchaseListViewModel.swift
//  PurchaseList
//
//  Created by Macbook Pro on 28/06/23.
//

import Foundation
import Alamofire

class NewPurchaseListViewModel: ObservableObject {
    
    @Published var date: Date
    @Published var items: [Item]
    
    private var networkService: NetworkService
    
    init(
        date: Date = .now,
        items: [Item] = [Item](),
        networkService: NetworkService = .shared
    ) {
        self.date = date
        self.items = items
        self.networkService = networkService
    }
    
    func appendToList(_ item: Item) {
        items.append(item)
    }
    
    func save(completion: @escaping(() -> Void)) {
        
        let headers: HTTPHeaders = [
            .accept("text/plain")
        ]
        
        let parameter = PurchaseList(stringDate: date.toServerFormat, items: items)
        
        AF
            .request(
                "https://localhost:7173/api/PurchaseLists",
                method: .post,
                parameters: parameter,
                encoder: JSONParameterEncoder.default,
                headers: headers
            )
            .response { response in
                switch response.result {
                case .success(let aaa):
                    print(aaa)
                    
                case .failure(let error):
                    print(error)
                }
            }
        
//        networkService.post(endpoint: "PurchaseLists", parameters: parameters) { error in
//            if let error {
//                print(error)
//            }
//            completion()
//        }
    }
}
