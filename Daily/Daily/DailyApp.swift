//
//  DailyApp.swift
//  Daily
//
//  Created by Xi Wu on 10/2/23.
//

import SwiftUI

@main
struct DailyApp: App {
    @State private var selectedImage: Image? // Create a binding for selectedImage

    var body: some Scene {
        WindowGroup {
            ContentView() // Pass the binding to ContentView
        }
    }
}

