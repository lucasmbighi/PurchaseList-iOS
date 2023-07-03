//
//  ContentView.swift
//  PurchaseList
//
//  Created by Macbook Pro on 27/06/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            PurchaseListsView()
                .environmentObject(PurchaseListsViewModel())
                .tabItem {
                    Label("Purchase List", systemImage: "shopping.cart")
                }
            
            StockListView()
                .environmentObject(StockListViewModel())
                .tabItem {
                    Label("Stock", systemImage: "list")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
