//
//  Vibes.swift
//  Cop-It
//
//  Created by Samuel Dyer on 2/24/24.
//

import Foundation
import SwiftUI

struct Vibes: Identifiable, Hashable, Decodable, Encodable {
    let id: Int
    let thumbnail: String
    let title: String
    let subtitle: String
    
    static let listOfVibes: [Vibes] = [
        Vibes(id: 01, thumbnail: "povAction", title: "Golf", subtitle: "Looking for a fit for the back 9's?"),
        Vibes(id: 02, thumbnail: "skiSlopes", title: "Aspen", subtitle: "Looking for a fit for the slopes?")
    ]
    
    init(id: Int, thumbnail: String, title: String, subtitle: String) {
        self.id = id
        self.thumbnail = thumbnail
        self.title = title
        self.subtitle = subtitle
    }
    
    var image: Image {
        Image(thumbnail)
    }
}
