//
//  AboutView.swift
//  Cop-It
//
//  Created by Samuel Dyer on 2/25/24.
//

import Foundation
import SwiftUI
import RealityKit
import RealityKitContent

struct AboutView: View {
    private var showAboutInfo = false
    var body: some View {
        VStack {
            Text("About Cop-It")
                .font(.extraLargeTitle)
                .padding(105)
            HStack{
                //In the About info
                VStack {
                    Text("Our highly over priced yet still better than your moms fabic is beyon a peons brain like your own. Now, we've priced it higher than yezzys shoes simply because we got it like that bozo. Obsorbed by the outter rim of liberalism and buy into our shitty values that benefit nobody except our CEO. ")
                    Button(action: {
                        
                    }) {
                        Text("Show Materials")
                    }
                }
            }
        }
    }
}
