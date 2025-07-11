//
//  BookwormApp.swift
//  Bookworm
//
//  Created by Dhiraj KC on 2025-06-21.
//

import SwiftData
import SwiftUI

@main
struct BookwormApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Book.self)
    }
}
