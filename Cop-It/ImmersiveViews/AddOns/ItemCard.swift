//
//  ItemCard.swift
//  Cop-It
//
//  Created by Samuel Dyer on 3/5/24.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct ItemCard: View {
    
    @Environment(\.openWindow) private var openWindow
    @EnvironmentObject var selectedItemViewModel: SelectedItemViewModel
    var currentItem: ShoppableItem
    
    var body: some View {
        HStack{
            Button(action: {
                print("Button tapped")
                if(selectedItemViewModel.isDetailViewPresented) {
                    selectedItemViewModel.selectedItem = currentItem
                } else {
                    
                    openWindow(id: "ItemDetailView")
                    selectedItemViewModel.selectedItem = currentItem
                    selectedItemViewModel.isDetailViewPresented = true
                }
            }) {
                VStack{
                    Image(currentItem.thumbnail)
                        .resizable()
                        .scaledToFit().scaleEffect(3.25)
                        .frame(width: 150, height: 160)


                    
                }
                
            }
            .buttonStyle(PlainButtonStyle())
        }
        .background(Color.gray)
        .clipShape(RoundedRectangle(cornerRadius: 46))

    }
}
