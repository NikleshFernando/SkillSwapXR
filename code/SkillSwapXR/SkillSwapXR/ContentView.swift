//
//  ContentView.swift
//  SkillSwapXR
//
//  Created by Niklesh Fernando on 2025-06-22.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct ContentView: View {

    var body: some View {
        MainAppView()
    }
}

#Preview {
    ContentView()
        .environment(AppModel())
}
