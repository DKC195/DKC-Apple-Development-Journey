//
//  iExpenseApp.swift
//  iExpense
//
//  Created by Dhiraj KC on 2025-05-25.
//

import SwiftUI
import SwiftData

@main
struct iExpenseApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: ExpenseItem.self)
    }
}
