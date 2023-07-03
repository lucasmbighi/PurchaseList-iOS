//
//  NewPurchaseListView.swift
//  PurchaseList
//
//  Created by Macbook Pro on 28/06/23.
//

import SwiftUI

struct NewPurchaseListView: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @State private var showNewItemSheet = false
    @State private var name = ""
    
    @EnvironmentObject private var viewModel: NewPurchaseListViewModel
    
    var body: some View {
        NavigationStack {
            Form {
                DatePicker("Pra quando?", selection: $viewModel.date, displayedComponents: .date)
                List(viewModel.items) { item in
                    Text(item.name)
                }
                Button {
                    viewModel.save {
                        presentationMode.wrappedValue.dismiss()
                    }
                } label: {
                    Text("Salvar")
                }

            }
            .navigationTitle("Nova Lista de Compras")
            .toolbar {
                NavigationLink {
                    NewItemView(onDoneAction: { item in
                        viewModel.appendToList(item)
                    })
                        .environmentObject(NewItemViewModel())
                } label: {
                    Text("Novo Item")
                }
            }
        }
    }
    
//    var list: some View {
//        if viewModel.items.isEmpty {
//            return Text("Nenhum item")
//        } else {
//            return List(viewModel.items) { item in
//
//            }
//        }
//    }
}

struct NewPurchaseListView_Previews: PreviewProvider {
    static var previews: some View {
        NewPurchaseListView()
            .environmentObject(NewPurchaseListViewModel())
    }
}
