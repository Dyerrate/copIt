//
//  ImmersiveView.swift
//  Cop-It
//
//  Created by Samuel Dyer on 2/24/24.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct ImmersiveView: View {

    @EnvironmentObject var selectedVibeModel: SelectedVibeModel
    @State private var rootEntity: Entity? = nil

    var body: some View {
        RealityView { content in
            if let entity = rootEntity {
                content.add(entity)
            }
        }
        .onChange(of: selectedVibeModel.selectedVibe?.immersiveBg) { newValue in
            // Load texture and create new entity here...
            guard let texture = try? TextureResource.load(named: newValue ?? "") else {fatalError("Texture not loaded!")}
            let rootEntity = Entity()

            var material = UnlitMaterial()
            material.color = .init(texture: .init(texture))

            rootEntity.components.set(ModelComponent(mesh: .generateSphere(radius: 1E3), materials: [material]))
            rootEntity.scale = .init(x: 1, y: 1, z: -1)
            rootEntity.transform.translation += SIMD3<Float>(0.0, 10.0, 0.0)
            let angle = Angle.degrees(90)
            let rotation = simd_quatf(angle: Float(angle.radians), axis: SIMD3<Float>(0, 1, 0))
            rootEntity.transform.rotation = rotation

            self.rootEntity = rootEntity
        }
        .frame(minWidth: 1021, maxWidth: 1280, minHeight: 580, maxHeight: 720)
    }
}


#Preview {
    ImmersiveView()
        .previewLayout(.sizeThatFits)
}

