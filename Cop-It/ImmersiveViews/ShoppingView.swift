//
//  ShoppingView.swift
//  Cop-It
//
//  Created by Samuel Dyer on 3/3/24.
//

import SwiftUI
import RealityKit
import RealityKitContent


struct ShoppingView: View {
    var currentVibes: Vibes
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Button("Left Button") {
                        // Action for the left button
                    }
                    Spacer()
                    Button("Right Button") {
                        // Action for the right button
                    }
                }
                .padding()
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 20) {
                        ForEach(0..<5) { index in
                            ShoppableItem() // Your custom card view
                        }
                    }
                    .padding()
                }
                .background(Color.clear)
            }
            .navigationBarHidden(true) // Hides the default navigation bar
        }
    }
}
