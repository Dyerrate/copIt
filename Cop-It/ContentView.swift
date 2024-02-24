//
//  ContentView.swift
//  Cop-It
//
//  Created by Samuel Dyer on 2/24/24.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct ContentView: View {

    @State private var showImmersiveSpace = false
    @State private var immersiveSpaceIsShown = false

    @Environment(\.openImmersiveSpace) var openImmersiveSpace
    @Environment(\.dismissImmersiveSpace) var dismissImmersiveSpace

    var body: some View {
        VStack {
            Text("What is the vibe for tonight?")
                .font(.extraLargeTitle)
            NavigationStack {
                ForEach(Vibes.listOfVibes) { vibe in
                    NavigationLink(destination: VibesDetailView(vibe: vibe)) {
                        HStack {
                            vibe.thumbnail
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
        .padding()
        .onChange(of: showImmersiveSpace) { _, newValue in
            Task {
                if newValue {
                    switch await openImmersiveSpace(id: "ImmersiveSpace") {
                    case .opened:
                        immersiveSpaceIsShown = true
                    case .error, .userCancelled:
                        fallthrough
                    @unknown default:
                        immersiveSpaceIsShown = false
                        showImmersiveSpace = false
                    }
                } else if immersiveSpaceIsShown {
                    await dismissImmersiveSpace()
                    immersiveSpaceIsShown = false
                }
            }
        }
    }
}

#Preview(windowStyle: .automatic) {
    ContentView()
}
