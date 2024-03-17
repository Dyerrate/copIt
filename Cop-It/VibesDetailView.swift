//
//  VibesDetailView.swift
//  Cop-It
//
//  Created by Samuel Dyer on 2/24/24.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct VibesDetailView: View {
    let currentVibe: Vibes
    
    var body: some View {
        RealityView { content in
            // Add the initial RealityKit content
            if let scene = try? await Entity(named: "Immersive", in: realityKitContentBundle) {
                content.add(scene)
            }
        }
    }
}
