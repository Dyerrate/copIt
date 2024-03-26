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
    let backgroundImg: String
    let immersiveBg: String
    //add the new immersive image to this
    
    static let listOfVibes: [Vibes] = [
        Vibes(id: 01, thumbnail: "golfCourse", title: "Golf", subtitle: "Looking for a fit for the back 9's?", backgroundImg: "golfCourse", immersiveBg: "golfEnvior"),
        Vibes(id: 02, thumbnail: "skiSlopes", title: "Aspen", subtitle: "Looking for a fit for the slopes?", backgroundImg: "skiBackground", immersiveBg: "skiLodge"),
        Vibes(id: 03, thumbnail: "wineryBackground", title: "Valley Winery", subtitle: "Having a wine tasting?", backgroundImg: "wineryBackground", immersiveBg: "wineValley")
    ]
    
    init(id: Int, thumbnail: String, title: String, subtitle: String, backgroundImg: String, immersiveBg: String) {
        self.id = id
        self.thumbnail = thumbnail
        self.title = title
        self.subtitle = subtitle
        self.backgroundImg = backgroundImg
        self.immersiveBg = immersiveBg
    }
    
    var image: Image {
        Image(thumbnail)
    }
}
