//
//  ItemDetailView.swift
//  Cop-It
//
//  Created by Samuel Dyer on 3/17/24.
//
import SwiftUI
import RealityKit
import RealityKitContent

struct ItemDetailView: View {
    @EnvironmentObject var selectedItemViewModel: SelectedItemViewModel
    var currentItem: ShoppableItem?
    @State private var yAxisRotation: Double = 0
    // Adding a state to track the last rotation value
    @State private var lastYAxisRotation: Double = 0


    var body: some View {
        NavigationStack {
            VStack {
                Model3D(named: currentItem!.model) { selectedItem in
                        selectedItem
                        .resizable()
                        .scaledToFit()
                        .scaleEffect(0.35)
                        .rotation3DEffect(.degrees(yAxisRotation), axis: (x: 0, y: 1, z: 0))
                        // Apply smooth spring animation
                        .animation(.spring(response: 0.3, dampingFraction: 0.7), value: yAxisRotation)
                        .gesture(touchAndDrag)
                } placeholder: {
                    ProgressView()
                }
                .gesture(touchAndDrag)
            }
            
        }
        .onDisappear() {
            selectedItemViewModel.isDetailViewPresented = false
        }
        .toolbar {
            ToolbarItemGroup(placement: .bottomOrnament) {
                Image(systemName: "square.and.arrow.up.circle.fill")
                    .symbolRenderingMode(.hierarchical)
                    .font(.largeTitle)
                
                Spacer()
                
                VStack {
                    Text(currentItem!.name)
                        .font(.largeTitle)
                    Text(currentItem!.description)
                        .foregroundStyle(.secondary)
                }
                .padding(.horizontal, 64)
                
                Button {
                    
                } label:  {
                    Text("Add to Cart")
                }
                .buttonStyle(.borderedProminent)
                .padding()
            }
        }
    }
    

    var touchAndDrag: some Gesture {
        DragGesture(minimumDistance: 0, coordinateSpace: .global)
            .onChanged { value in
                // Update the rotation based on the gesture
                let rotationChange = Double(value.translation.width) / 3
                yAxisRotation = lastYAxisRotation + rotationChange
            }
            .onEnded { _ in
                // When the gesture ends, update the last rotation to the current one
                lastYAxisRotation = yAxisRotation
            }
    }
}
