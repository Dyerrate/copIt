//
//  ItemCard.swift
//  Cop-It
//
//  Created by Samuel Dyer on 3/5/24.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct ItemCard: View {
    
    @Environment(\.openWindow) private var openWindow
    var currentItem: ShoppableItem
    
    var body: some View {
        VStack{
            Button(action: {
                print("Button tapped")
                openWindow(id: "ItemDetailView", value: currentItem)
            }) {
                Text("item \(currentItem.name)")
            }
        }
    }
}
