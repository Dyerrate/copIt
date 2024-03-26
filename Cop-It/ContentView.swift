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
    //changes
    func openImmersive(selectedVibe: Vibes) {
        Task {
            let result = await openImmersiveSpace(id: "Aspen")
            if case .error = result {
                print("There was an error opening up the current \(selectedVibe.title)")
            }
            selectedVibeModel.selectedVibe = selectedVibe
            selectedVibeModel.isImmersiveOpen = true
        }
    }
    
    private var listOfVibes = Vibes.listOfVibes
    @State private var showImmersiveSpace = false
    @Environment(\.openImmersiveSpace) var openImmersiveSpace
    @Environment(\.dismissImmersiveSpace) var dismissImmersiveSpace
    @EnvironmentObject var selectedVibeModel: SelectedVibeModel
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer(minLength: 0)
                Text("Choose your venue")
                    .font(.extraLargeTitle2)
                    .padding()
                Spacer()
                VStack {
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(alignment: .center, spacing: 20) {
                            ForEach(listOfVibes) { vibe in
                                NavigationLink(destination: ShoppingView(currentVibeIs: vibe).onAppear(perform: { self.openImmersive(selectedVibe: vibe)
    })) {
                                    VStack {
                                        Image(vibe.thumbnail)
                                            .resizable()
                                            .scaledToFit()
                                            .frame(height: 300) // Set as per your requirement
                                            .cornerRadius(10)
                                            .overlay(RoundedRectangle(cornerRadius: 10)
                                                .stroke(Color.gray, lineWidth: 1).allowsHitTesting(false))
                                        Text(vibe.title)
                                            .font(.title)
                                            .multilineTextAlignment(.center)
                                            .padding(.top, 5)
                                    }
                                }
                                .buttonStyle(PlainButtonStyle())
                            }
                        }
                        
                    }
                }
            }
        }
        
        .navigationViewStyle(StackNavigationViewStyle())

    }
}
