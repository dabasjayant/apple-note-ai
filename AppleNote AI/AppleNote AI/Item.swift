//
//  Item.swift
//  AppleNote AI
//
//  Created by Jayant Dabas on 3/20/25.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    var title: String
    var note: String
    
    init(timestamp: Date, title: String, note: String) {
        self.timestamp = timestamp
        self.title = title
        self.note = note
    }
}
