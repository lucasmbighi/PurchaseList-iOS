//
//  PurchaseListsView.swift
//  PurchaseList
//
//  Created by Macbook Pro on 28/06/23.
//

import SwiftUI

struct PurchaseListsView: View {
    
    @EnvironmentObject private var viewModel: PurchaseListsViewModel
    
    var body: some View {
        NavigationStack {
            List(viewModel.lists) { list in
                NavigationLink {
                    PurchaseListDetailView()
                        .environmentObject(PurchaseListDetailViewModel(list: list))
                } label: {
                    VStack {
                        Text(list.formattedDate)
                        Text(list.itemsDescription)
                    }
                }
            }
            .navigationTitle("Listas de compras")
            .toolbar {
                NavigationLink {
                    NewPurchaseListView()
                        .environmentObject(NewPurchaseListViewModel())
                } label: {
                    Image(systemName: "plus")
                }
            }
        }
        .onAppear {
            viewModel.fetchLists()
        }
    }
}

struct PurchaseListsView_Previews: PreviewProvider {
    static var previews: some View {
        
        let vm = PurchaseListsViewModel(lists: PurchaseList.mock)
        
        PurchaseListsView()
            .environmentObject(vm)
    }
}
