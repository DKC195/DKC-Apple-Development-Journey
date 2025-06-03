//
//  ContentView.swift
//  Navigation
//
//  Created by Dhiraj KC on 2025-06-03.
//

import SwiftUI

struct ContentView: View {
    @State private var title = "SwiftUI"
    
    var body: some View {
        NavigationStack {
            Text("Hello, World")
                .navigationTitle($title)
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    ContentView()
}
