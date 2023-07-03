//
//  PurchaseListDetailView.swift
//  PurchaseList
//
//  Created by Macbook Pro on 28/06/23.
//

import SwiftUI

struct PurchaseListDetailView: View {
    
    @EnvironmentObject private var viewModel: PurchaseListDetailViewModel
    
    var body: some View {
        NavigationStack {
            List(viewModel.list.items) { item in
                Text(item.name)
            }
            .navigationTitle(viewModel.list.formattedDate)
            .toolbar {
                NavigationLink {
                    NewPurchaseListView()
                        .environmentObject(NewPurchaseListViewModel())
                } label: {
                    
                }
            }
        }
    }
}

struct PurchaseListDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PurchaseListDetailView()
            .environmentObject(PurchaseListDetailViewModel(list: PurchaseList.mock[0]))
    }
}
