//
//  ShoppableItem.swift
//  Cop-It
//
//  Created by Samuel Dyer on 3/5/24.
//

import Foundation
import SwiftUI


struct ShoppableItem: Identifiable, Equatable {
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
    
    static let demoListOfItems: [ShoppableItem] = [ // This is a demo list of items
  //      ShoppableItem(id: UUID(), name: "Shirt", price: 20.0, category: "Ski", inventoryCount: 100.0, description: "A nice shirt", image: Image("Shirt")),
        ShoppableItem(id: UUID(), name: "Pants", price: 30.0, category: "Ski", inventoryCount: 100.0, description: "A nice pair of pants", image: Image("Pants")),
        ShoppableItem(id: UUID(), name: "Shoes", price: 40.0, category: "Ski", inventoryCount: 100.0, description: "A nice pair of shoes", image: Image("Shoes")),
        ShoppableItem(id: UUID(), name: "Hat", price: 10.0, category: "Ski", inventoryCount: 100.0, description: "A nice hat", image: Image("hat"))]
    
    
}
