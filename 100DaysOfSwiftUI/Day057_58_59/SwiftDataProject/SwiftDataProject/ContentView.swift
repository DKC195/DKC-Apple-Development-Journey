//
//  ContentView.swift
//  SwiftDataProject
//
//  Created by Dhiraj KC on 2025-07-11.
//

import SwiftData
import SwiftUI

struct ContentView: View {
    @Environment(\.modelContext) var modelContext
    @State private var showingUpcomingOnly = false
    @State private var sortOrder = [
        SortDescriptor(\User.name),
        SortDescriptor(\User.joinDate)
    ]
    
    var body: some View {
        NavigationStack {
            UsersView(minimumJoinDate: showingUpcomingOnly ? .now : .distantPast, sortOrder: sortOrder)
                .navigationTitle(Text("Users"))
                .toolbar {
                    Button("Add Samples", systemImage: "plus") {
                        try? modelContext.delete(model: User.self)
                        let first = User(name: "Dhiraj KC", city: "KTM", joinDate: .now.addingTimeInterval(86400 * -10))
                        let second = User(name: "Shihar KC", city: "Tokyo", joinDate: .now.addingTimeInterval(86400 * -5))
                        let third = User(name: "Aabishkar KC", city: "Gulmi", joinDate: .now.addingTimeInterval(86400 * 5))
                        let forth = User(name: "Asmita KC", city: "Gulmi", joinDate: .now.addingTimeInterval(86400 * 10))
                        
                        modelContext.insert(first)
                        modelContext.insert(second)
                        modelContext.insert(third)
                        modelContext.insert(forth)
                    }
                    
                    Button(showingUpcomingOnly ? "Show Everyone" : "Show Upcoming") {
                        showingUpcomingOnly.toggle()
                    }
                    
                    Menu("Sort", systemImage: "arrow.up.arrow.down") {
                        Picker("Sort", selection: $sortOrder) {
                            Text("Sort by Name")
                                .tag([
                                    SortDescriptor(\User.name),
                                    SortDescriptor(\User.joinDate)
                                ])
                            Text("Sort by Join Date")
                                .tag([
                                    SortDescriptor(\User.joinDate),
                                    SortDescriptor(\User.name)
                                ])
                        }
                    }
                }
        }
    }
}

#Preview {
    ContentView()
}
