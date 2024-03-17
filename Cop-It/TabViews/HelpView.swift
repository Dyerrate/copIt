//
//  HelpView.swift
//  Cop-It
//
//  Created by Samuel Dyer on 2/25/24.
//

import Foundation
import SwiftUI
import RealityKit
import RealityKitContent

struct HelpView: View {
    var body: some View {
        VStack{
            Text("Help & Support")
                .font(.extraLargeTitle)
                .padding(16)
            VStack{
                Text("Contact Us")
                    .padding(105)
                HStack {
                    Image(systemName: "phone")
                        .resizable()
                        .frame(width: 50, height: 50)
                    Text("(218) - 356 - 1233")
                }
            }
        }
    }
}
