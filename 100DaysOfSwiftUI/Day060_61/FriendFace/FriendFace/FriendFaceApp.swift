//
//  FriendFaceApp.swift
//  FriendFace
//
//  Created by Dhiraj KC on 2025-07-18.
//

import SwiftData
import SwiftUI

@main
struct FriendFaceApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: [User.self])
    }
}
