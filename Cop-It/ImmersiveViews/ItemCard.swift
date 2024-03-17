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
    var currentItem: ShoppableItem
    
    var body: some View {
        VStack{
            Text("item \(currentItem.name)")
                
        }
    }
}
