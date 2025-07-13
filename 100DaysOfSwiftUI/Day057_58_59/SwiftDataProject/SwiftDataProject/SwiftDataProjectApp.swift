//
//  SwiftDataProjectApp.swift
//  SwiftDataProject
//
//  Created by Dhiraj KC on 2025-07-11.
//

import SwiftData
import SwiftUI

@main
struct SwiftDataProjectApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: User.self)
    }
}
