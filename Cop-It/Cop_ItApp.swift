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
    var body: some Scene {
        WindowGroup(id: "MainView") {
            ContentView()
                .frame (minWidth: 1021, maxWidth: 1280, minHeight: 580, maxHeight: 720)
        }
        WindowGroup(id: "ShoppingCartView") {
            ShoppingCartView()
        }
        .defaultSize(width: 430, height: 720)
        ImmersiveSpace(id: "Aspen") {
                ImmersiveView()
        }.immersionStyle(selection: $immersionStyle, in: .full)

    }
}
