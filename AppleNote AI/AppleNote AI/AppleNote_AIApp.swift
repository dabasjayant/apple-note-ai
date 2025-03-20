//
//  AppleNote_AIApp.swift
//  AppleNote AI
//
//  Created by Jayant Dabas on 3/20/25.
//

import SwiftUI
import SwiftData

@main
struct AppleNote_AIApp: App {
    @NSApplicationDelegateAdaptor private var appDelegate: AppDelegate

    var body: some Scene {
        WindowGroup {
            ContentView()
                .frame(minWidth: 240, maxWidth: .infinity, minHeight: 120, maxHeight: .infinity)
        }
        .windowStyle(.hiddenTitleBar)
        .commands {
//            CommandGroup(replacing: .newItem) {
//                Button("New note") {}
//            }
            CommandMenu("Color") {}
            CommandMenu("Features") {}
        }
    }
}
