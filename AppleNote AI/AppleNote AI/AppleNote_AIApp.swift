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
    @Environment(\.openWindow) private var openWindow
//    @NSApplicationDelegateAdaptor private var appDelegate: AppDelegate

    var body: some Scene {
        WindowGroup(id: "note-viewer") {
            ContentView()
        }
        .defaultSize(width: 320, height: 240)
        .windowStyle(.hiddenTitleBar)
        .commands {
            CommandGroup(replacing: .newItem) {
                Button("New note") {
                    openWindow(id: "note-viewer")
                }
            }
            CommandMenu("Color") {}
            CommandMenu("Features") {}
        }
    }
}
