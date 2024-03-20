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
    var body: some View {
        VStack {
            VStack {
                Text(currentItem!.name)
                    .font(.title)
                Text(currentItem!.description)
                    .font(.subheadline)
                Spacer()
                Button(action: {
                    print("Add to Cart")
                }) {
                    Text("Add to Cart")
                }
            }
            Model3D(named: currentItem!.model)
                .frame(width: 300, height: 300)
                .cornerRadius(20)
        }
        .onDisappear() {
            selectedItemViewModel.isDetailViewPresented = false
        }
    }
}
