//
//  SelectedVibeModel.swift
//  Cop-It
//
//  Created by Samuel Dyer on 3/25/24.
//

import Foundation
class SelectedVibeModel: ObservableObject {
    @Published var selectedVibe: Vibes?
    @Published var isImmersiveOpen: Bool = false
}
