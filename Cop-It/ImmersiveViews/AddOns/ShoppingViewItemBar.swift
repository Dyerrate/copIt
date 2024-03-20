//
//  ShoppingViewItemBar.swift
//  Cop-It
//
//  Created by Samuel Dyer on 3/17/24.
//

import Foundation
import SwiftUI
import RealityKit
import RealityKitContent

struct ShoppingViewItemBar: View {
    var currentItem: [ShoppableItem]
    var body: some View {
        ScrollView(.horizontal,showsIndicators: false) {
            HStack(spacing: 10){
                ForEach(currentItem) { item in
                    ItemCard(currentItem: item)
                        .frame(width: 150, height: 160)
                        .padding(.trailing, 20)
                }
            }
        }
    }
}
