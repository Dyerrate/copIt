//
//  SelectedItemViewModel.swift
//  Cop-It
//
//  Created by Samuel Dyer on 3/17/24.
//

import Foundation
class SelectedItemViewModel: ObservableObject {
    @Published var selectedItem: ShoppableItem?
    @Published var isDetailViewPresented: Bool = false
    @Published var isShoppingCartOpen: Bool = false
}
