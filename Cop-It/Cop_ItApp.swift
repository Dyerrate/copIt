//
//  Cop_ItApp.swift
//  Cop-It
//
//  Created by Samuel Dyer on 2/24/24.
//

import SwiftUI

@main
struct Cop_ItApp: App {
    @State private var currentView = ""
    @State private var immersionStyle: ImmersionStyle = .full
    @StateObject private var selectedItemViewModel = SelectedItemViewModel()
    @StateObject private var selectedVibeModel = SelectedVibeModel()
   

    var body: some Scene {
        WindowGroup(id: "MainView") {
            ContentView()
                .environmentObject(selectedItemViewModel) // Pass the view model to your view hierarchy
                .environmentObject(selectedVibeModel)
                .frame (minWidth: 1021, maxWidth: 1280, minHeight: 580, maxHeight: 720)
        }
        WindowGroup(id: "ShoppingCartView") {
            ShoppingCartView()
        }
        .defaultSize(width: 430, height: 720)
        WindowGroup(id: "ItemDetailView") { 
            ItemDetailView(currentItem: selectedItemViewModel.selectedItem)
                .environmentObject(selectedItemViewModel) // Pass the view model to your view hierarchy
                .frame (minWidth: 830, maxWidth: 1280, minHeight: 467, maxHeight: 720)// Pass the 'item' to the view
                }
        .defaultSize(width: 830, height: 467)
        
        ImmersiveSpace(id: "Aspen") {
                ImmersiveView()
                .environmentObject(selectedVibeModel)
                
        }.immersionStyle(selection: $immersionStyle, in: .full)

    }
}
