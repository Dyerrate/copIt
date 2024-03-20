//
//  ShoppableItem.swift
//  Cop-It
//
//  Created by Samuel Dyer on 3/5/24.
//
import Foundation
import SwiftUI

class ShoppableItem: Identifiable, Equatable, Hashable, Codable {
    let id: UUID
    let name: String
    let price: Double
    let category: String
    let inventoryCount: Int // Changed to Int if applicable
    let description: String
    let model: String
    let thumbnail: String

    init(id: UUID, name: String, price: Double, category: String, inventoryCount: Int, description: String, model: String, thumbnail: String) {
        self.id = id
        self.name = name
        self.price = price
        self.category = category
        self.inventoryCount = inventoryCount
        self.description = description
        self.model = model
        self.thumbnail = thumbnail
    }

    // Equatable protocol method
    static func == (lhs: ShoppableItem, rhs: ShoppableItem) -> Bool {
        return lhs.id == rhs.id
    }

    // Hashable protocol method
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }

    // CodingKeys for Codable protocol
    private enum CodingKeys: String, CodingKey {
        case id, name, price, category, inventoryCount, description, model, thumbnail// Changed 'image' to 'imageURL'
    }
}

