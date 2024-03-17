//
//  ShoppingViewItemBar.swift
//  Cop-It
//
//  Created by Samuel Dyer on 3/17/24.
//

import Foundation
import SwiftUI
import RealityKit
import RealityKitContent

struct ShoppingViewItemBar: View {
    var currentItem: ShoppableItem
    
    var body: some View {
        HStack {
            VStack {
                Text("item \(currentItem.name)")
            }
        }
    }
}
