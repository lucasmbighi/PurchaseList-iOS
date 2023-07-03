//
//  StockListView.swift
//  PurchaseList
//
//  Created by Macbook Pro on 27/06/23.
//

import SwiftUI

struct StockListView: View {
    
    @EnvironmentObject private var viewModel: StockListViewModel
    
    var body: some View {
        NavigationStack {
            List(viewModel.stockItems) { item in
                Text(item.name)
                    .swipeActions {
                        Button("Delete") {
                            viewModel.delete(item)
                        }
                    }
            }
            .navigationTitle("Stock")
        }
    }
}

struct StockListView_Previews: PreviewProvider {
    static var previews: some View {
        
        let vm = StockListViewModel(stockItems: Item.mock)
        
        StockListView()
            .environmentObject(vm)
    }
}
