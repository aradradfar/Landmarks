//
//  LandmarksApp.swift
//  Landmarks
//
//  Created by Arad Radfar on 7/26/22.
//

import SwiftUI

@main
struct LandmarksApp: App {
    @StateObject private var modelData = ModelData()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
        }
    }
}
