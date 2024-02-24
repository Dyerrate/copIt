//
//  Vibes.swift
//  Cop-It
//
//  Created by Samuel Dyer on 2/24/24.
//

import Foundation
import SwiftUI


struct Vibes: Identifiable {
    let id: Int
    let thumbnail: Image
    let title: String
    let subtitle: String
    
    static let listOfVibes: [Vibes] = [Vibes(id: 01, thumbnail: Image("povAction"), title: "Indoor with The bros?", subtitle: "Discover these classing relaxing jorts")]
    
    init(id: Int, thumbnail: Image, title: String, subtitle: String) {
        self.id = id
        self.thumbnail = thumbnail
        self.title = title
        self.subtitle = subtitle
    }
    
}
