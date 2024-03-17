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
    private let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    
    @Environment(\.openWindow) private var openWindow
    @Environment(\.dismiss) private var dismiss
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    func createShoppingItemsTest() -> [ShoppableItem] {
        let currentItems = ShoppableItem.demoListOfItems
        let repeatedItems = Array(repeatElement(currentItems, count: 3)).flatMap { $0 } // assuming currentItems has 3 items
        return repeatedItems
    }
    private var shoppingItems: [ShoppableItem] {
        return createShoppingItemsTest()
    }
    
    var body: some View {
        
        VStack {
            HStack {
                ScrollView(.vertical, showsIndicators: false) {
                    ForEach(shoppingItems) { item in
                        Button(action: {
                            openWindow(id: "quickLookView")
                        }) {
                            ItemCard(currentItem: item)
                                .frame(width: 150, height: 165)
                        }
                        .frame(width: 150, height: 165)
                    }
                    
                }
                .padding()
                ScrollView(.vertical, showsIndicators: false) {
                    ForEach(shoppingItems) { item in
                        Button(action: {
                            openWindow(id: "quickLookView")
                        }) {
                            ItemCard(currentItem: item)
                                .frame(width: 150, height: 165)
                        }
                        .frame(width: 150, height: 165)
                    }
                    
                }
                Spacer()
            }
            
        }
        .navigationBarTitle("Detail View")
        .navigationBarTitleDisplayMode(.inline)// Sets the title for the navigation bar
        /*.navigationBarBackButtonHidden(true)*/ // Hides the default back button
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
