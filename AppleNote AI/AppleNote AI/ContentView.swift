//
//  ContentView.swift
//  AppleNote AI
//
//  Created by Jayant Dabas on 3/20/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    
    @State public var note: String = ""
    @State public var expanded: Bool = true
    
    @State var titleHeight: CGFloat = 28
    @State var prevHeight: CGFloat = 240
    
    @State var firstLaunch = true

    var body: some View {
        GeometryReader { geometry in
            VStack {
                VStack {
                    Text("Test window")
                        .padding(.top, 6)
                        .padding(.bottom, 6)
                        .bold()
                        .frame(maxWidth: .infinity)
                        .background(Color.red)
                        .ignoresSafeArea()
                        .gesture(TapGesture().onEnded {
                            if let window = NSApplication.shared.windows.first {
                                toggleWindow(window: window)
                            }
                        })
                    
//                    TextEditor(text: $note)
//                        .scrollContentBackground(.hidden)
//                        .background(Color.clear)
//                        .disableAutocorrection(true)
//                        .padding(6)
                }
            }
            .frame(minWidth: 240, maxWidth: .infinity, minHeight: titleHeight, maxHeight: .infinity)
            .padding(.horizontal, 4)
            .padding(.bottom, 4)
            .ignoresSafeArea()
//            .onAppear {
//                if firstLaunch, let window = NSApplication.shared.keyWindow {
//                    window.level = .floating
//                    if let miniButton = window.standardWindowButton(.miniaturizeButton) {
//                        miniButton.isHidden = true
//                    }
//                    if let zoomButton = window.standardWindowButton(.zoomButton) {
//                        zoomButton.isHidden = true
//                    }
//                }
//                if let menu = NSApplication.shared.mainMenu {
//                    menu.items.removeAll { $0.title == "View" }
//                }
//                firstLaunch = false
//            }
            .onChange(of: geometry.size.height) {
                if (expanded) {
                    prevHeight = geometry.size.height
                    print(prevHeight)
                }
            }
        }
    }
    
    private func toggleWindow(window: NSWindow) {
        let newHeight: CGFloat = expanded ? titleHeight : prevHeight
        let x = window.frame.origin.x
        let y = window.frame.origin.y
        
        let newY = y + (window.frame.height - newHeight)
        
        let newFrame = NSRect(x: x, y: newY, width: window.frame.width, height: newHeight)
        window.setFrame(newFrame, display: true, animate: true)
        
        expanded ? expanded.toggle() : DispatchQueue.main.asyncAfter(deadline: .now() + 0.01) {
            expanded.toggle()
        }
    }
}

#Preview {
    ContentView()
}
