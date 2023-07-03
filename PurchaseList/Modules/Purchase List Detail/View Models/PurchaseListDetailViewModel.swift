//
//  PurchaseListDetailViewModel.swift
//  PurchaseList
//
//  Created by Macbook Pro on 28/06/23.
//

import Foundation

class PurchaseListDetailViewModel: ObservableObject {
    
    @Published var list: PurchaseList
    
    init(list: PurchaseList? = nil) {
        self.list = list ?? PurchaseList(stringDate: Date.now.toServerFormat, items: [Item]())
    }
}

//Preciso colocar esse environment na view e passar a lista aqui pra dentro no clique da celula
