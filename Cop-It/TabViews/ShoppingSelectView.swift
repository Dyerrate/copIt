//
//  ShoppingSelectView.swift
//  Cop-It
//
//  Created by Samuel Dyer on 2/25/24.
//

import Foundation
import SwiftUI
import RealityKit
import RealityKitContent

struct ShoppingSelectView: View {
    
    @Environment(\.openImmersiveSpace) var openImmersiveSpace
    @Environment(\.dismissImmersiveSpace) var dismissImmersiveSpace
    @Environment(\.openWindow) private var openWindow
    @Environment(\.dismiss) private var dismiss

    @State private var immersiveSpaceIsShown = false
    @State var currentVibeIs: Vibes?

    var body: some View {
        VStack {
            Text("Whats the occasion?")
                .font(.extraLargeTitle)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(Vibes.listOfVibes) { vibe in
                        Button(action: {
                             currentVibeIs = vibe
                            Task {
                                if !immersiveSpaceIsShown {
                                    let result = await openImmersiveSpace(id: "ImmrfersiveSpace")
                                    if case .error = result {
                                        print("An error occurred opening ImmersiveSpace")
                                        immersiveSpaceIsShown = false
                                    } else {
                                        print("Opening Immersive space and close")
                                        immersiveSpaceIsShown = true
                                        dismiss()
                                        openWindow(id:"ShoppingView",value: currentVibeIs)
                                    }
                                } else {
                                    await dismissImmersiveSpace()
                                    immersiveSpaceIsShown = false
                                    dismiss()
                                    openWindow(id: "MainView")
                                }
                            }
                            print("Button for \(vibe.title) pressed")
                        }) {
                            HStack {
                                vibe.image
                                    .resizable()
                                    .frame(width: 100, height: 100)
                                VStack(alignment: .leading) {
                                    Text(vibe.title)
                                        .font(.title)
                                    Text(vibe.subtitle)
                                        .font(.subheadline)
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}
