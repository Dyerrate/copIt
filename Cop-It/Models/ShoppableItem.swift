//
//  ShoppableItem.swift
//  Cop-It
//
//  Created by Samuel Dyer on 3/5/24.
//

import Foundation
import SwiftUI


struct ShoppableItem: Identifiable {
    let id: UUID
    let name: String
    let price: Double
    let category: String
    let inventoryCount: Double
    let description: String
    let image: Image
    
    init(id: UUID, name: String, price: Double, category: String, inventoryCount: Double, description: String, image: Image) {
        self.id = id
        self.name = name
        self.price = price
        self.category = category
        self.inventoryCount = inventoryCount
        self.description = description
        self.image = image
    }
}
