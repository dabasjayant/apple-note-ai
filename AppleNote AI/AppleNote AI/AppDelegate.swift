//
//  AppDelegate.swift
//  AppleNote AI
//
//  Created by Jayant Dabas on 3/20/25.
//

import AppKit

class AppDelegate: NSObject, NSApplicationDelegate, ObservableObject {
    
    func applicationDidFinishLaunching(_ notification: Notification) {
        for window in NSApplication.shared.windows {
            window.level = .floating
            window.standardWindowButton(.miniaturizeButton)!.isHidden = true
            window.standardWindowButton(.zoomButton)!.isHidden = true
            
            if let menu = NSApplication.shared.mainMenu {
                menu.items.removeAll { $0.title == "View" }
            }
        }
    }
}
