//
//  ContentView.swift
//  AppleNote AI
//
//  Created by Jayant Dabas on 3/20/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [Item]
    
    @State private var text = "Write your note here..."
    @State private var position = CGPoint(x: 100, y: 100)
    
    @State public var note: String = ""

    var body: some View {
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
                        print("single clicked")
                    })
                
                TextEditor(text: $note)
                    .scrollContentBackground(.hidden)
                    .background(Color.clear)
                    .disableAutocorrection(true)
                    .padding(6)
            }
        }
        .padding(.horizontal, 4)
        .padding(.bottom, 4)
        .ignoresSafeArea()
        
    }

    private func addItem() {
        withAnimation {
            let newItem = Note(timestamp: Date(), title:"", note:"")
            modelContext.insert(newItem)
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(items[index])
            }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
