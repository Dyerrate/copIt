//
//  ShoppingView.swift
//  Cop-It
//
//  Created by Samuel Dyer on 3/3/24.
//

import SwiftUI
import RealityKit
import RealityKitContent


struct ShoppingView: View {
    @State var currentVibeIs: Vibes
    @State private var scrollAmount = 0.0
    
    @Environment(\.dismissImmersiveSpace) private var dismissImmersiveSpace
    @Environment(\.openWindow) private var openWindow
    @Environment(\.dismiss) private var dismiss
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @EnvironmentObject var selectedItemViewModel: SelectedItemViewModel
    @EnvironmentObject var selectedVibeModel: SelectedVibeModel

    
    private let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    private var shoppingItems: [ShoppableItem] {
        return createShoppingItemsTest()
    }
    
    //NOTE: Methods start here
    func createShoppingItemsTest() -> [ShoppableItem] {
        //Create logic for which vibe was selected
        let currentItems = [ShoppableItem(id: UUID(), name: "Black Crow Skis", price: 30.0, category: "Ski", inventoryCount: Int(100.0), description: "A nice pair of Black Crows", model: "skis", thumbnail: "skiPng"),
                            ShoppableItem(id: UUID(), name: "Ski Boots", price: 40.0, category: "Ski", inventoryCount: Int(100.0), description: "A nice pair heave boots", model: "skiBoots", thumbnail: "snowBoot"),
                            ShoppableItem(id: UUID(), name: "Helmet", price: 10.0, category: "Ski", inventoryCount: Int(100.0), description: "A nice hat", model: "skiHelmet", thumbnail: "helmetPng")]
        let repeatedItems = Array(repeatElement(currentItems, count: 5)).flatMap { $0 } // assuming currentItems has 3 items
        return repeatedItems
    }
    //Checks if cart is open already
    func checkForOpenCart() {
        if (!selectedItemViewModel.isShoppingCartOpen) {
            selectedItemViewModel.isShoppingCartOpen = true
            openWindow(id: "ShoppingCartView")
        }
        
    }
    
    //NOTE: UI Starts here
    var body: some View {
        ZStack {
            Image(currentVibeIs.backgroundImg)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .edgesIgnoringSafeArea(.all)

            VStack {
                Spacer()
                ShoppingViewItemBar(currentItem: shoppingItems)
                    .padding(.bottom,55)
            }
            .navigationBarTitle("Shopping")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) { // Back button
                        Button(action: {
                            self.presentationMode.wrappedValue.dismiss()
                            selectedVibeModel.isImmersiveOpen = false
                            Task {
                                await dismissImmersiveSpace()
                            }
                        }) {
                                Image(systemName: "arrow.backward") // Use an arrow icon
                            }
                        }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        checkForOpenCart()
                    }) {
                        Image(systemName: "cart")
                    }
                }
            }
        }
        .onReceive(timer) { _ in
            scrollAmount += 10
            if scrollAmount > 1000 { // Reset scrollAmount after reaching a limit
                scrollAmount = 0
            }
            
        }
    }
}
