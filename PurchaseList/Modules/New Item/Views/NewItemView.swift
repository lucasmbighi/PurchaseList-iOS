//
//  NewItemView.swift
//  PurchaseList
//
//  Created by Macbook Pro on 28/06/23.
//

import SwiftUI

struct NewItemView: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @EnvironmentObject private var viewModel: NewItemViewModel
    
    var onDoneAction: ((Item) -> Void)?
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Nome", text: $viewModel.name)
                Stepper("Quantidade: \(viewModel.quantity)", value: $viewModel.quantity)
                Picker("Unidade", selection: $viewModel.unity) {
                    ForEach(Unity.allCases) { unity in
                        Text(unity.localizedRawValue(quantity: viewModel.quantity))
                            .tag(unity)
                    }
                }
                Button("Pronto") {
                    onDoneAction?(viewModel.newItem)
                    presentationMode.wrappedValue.dismiss()
                }
            }
        }
    }
}

struct NewItemView_Previews: PreviewProvider {
    static var previews: some View {
        NewItemView()
            .environmentObject(NewItemViewModel())
    }
}
