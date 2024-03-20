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
    @Environment(\.openWindow) private var openWindow
    @Environment(\.dismiss) private var dismiss
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
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
        let repeatedItems = Array(repeatElement(currentItems, count: 3)).flatMap { $0 } // assuming currentItems has 3 items
        return repeatedItems
    }
    
    
    //NOTE: UI Starts here
    var body: some View {
        
        VStack {
            Spacer()
            ShoppingViewItemBar(currentItem: shoppingItems)
                .padding(.bottom,25)
            
        }
        .navigationBarTitle("Shopping")
        .navigationBarTitleDisplayMode(.inline)
        /*.navigationBarBackButtonHidden(true)*/
        .toolbar {
            
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: {
                    //We will go to shoppingCart panel on the right
                    openWindow(id: "ShoppingCartView")
                }) {
                    Image(systemName: "cart")
                }
                
            }
            // Add more ToolbarItems for other purposes, if needed
        }
        
        .onReceive(timer) { _ in
            scrollAmount += 10
            if scrollAmount > 1000 { // Reset scrollAmount after reaching a limit
                scrollAmount = 0
            }
            
        }
    }
}
