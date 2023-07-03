//
//  PurchaseListsViewModel.swift
//  PurchaseList
//
//  Created by Macbook Pro on 28/06/23.
//

import Foundation

class PurchaseListsViewModel: ObservableObject {
    
    @Published var lists: [PurchaseList]
    
    private let networkService: NetworkService
    
    init(
        lists: [PurchaseList] = [PurchaseList](),
        networkService: NetworkService = .shared
    ) {
        self.lists = lists
        self.networkService = networkService
    }
    
    func fetchLists() {
        networkService.get(endpoint: "PurchaseLists", ofType: [PurchaseList].self) { result in
            switch result {
            case .success(let lists):
                self.lists = lists
            case .failure(let error):
                print(error)
            }
        }
    }
}
