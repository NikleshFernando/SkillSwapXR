//
//  SkillSwapXRApp.swift
//  SkillSwapXR
//
//  Created by Niklesh Fernando on 2025-06-24.
//

import SwiftUI

@main
struct SkillSwapXRApp: App {

    @State private var appModel = AppModel()
    
    @StateObject private var skillStore = SkillDataStore()
    @StateObject private var offerStore = OfferDataStore()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(skillStore)
                .environmentObject(offerStore)
                }

        ImmersiveSpace(id: appModel.immersiveSpaceID) {
            ImmersiveView()
                .environment(appModel)
                .onAppear {
                    appModel.immersiveSpaceState = .open
                }
                .onDisappear {
                    appModel.immersiveSpaceState = .closed
                }
        }
        .immersionStyle(selection: .constant(.full), in: .full)
    }
}
