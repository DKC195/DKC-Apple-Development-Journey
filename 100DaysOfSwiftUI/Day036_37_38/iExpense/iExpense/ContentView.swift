//
//  ContentView.swift
//  iExpense
//
//  Created by Dhiraj KC on 2025-05-25.
//

import SwiftData
import SwiftUI

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext

    @State private var sortOrder = [
        SortDescriptor(\ExpenseItem.name),
        SortDescriptor(\ExpenseItem.amount)
    ]
    
    @Query var unsortedExpenses: [ExpenseItem]

    @State private var filterType: FilterType = .all
    @State private var showingAddExpense = false

    var body: some View {
        NavigationStack {
            List {
                ForEach(filteredExpenses) { item in
                    ListGen(item: item)
                }
                .onDelete { offsets in
                    delete(offsets, from: filteredExpenses)
                }
            }
            .navigationTitle("iExpense")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItemGroup(placement: .topBarLeading) {
                    NavigationLink(destination: AddView()) {
                        Text("Add Expense")
                    }
                }

                ToolbarItemGroup(placement: .topBarTrailing) {
                    Menu("Filter", systemImage: "line.3.horizontal.decrease.circle") {
                        Picker("Filter", selection: $filterType) {
                            ForEach(FilterType.allCases, id: \.self) { type in
                                Text(type.rawValue).tag(type)
                            }
                        }
                    }

                    Menu("Sort", systemImage: "arrow.up.arrow.down") {
                        Button("Sort by Name") {
                            sortOrder = [
                                SortDescriptor(\ExpenseItem.name),
                                SortDescriptor(\ExpenseItem.amount)
                            ]
                        }

                        Button("Sort by Amount") {
                            sortOrder = [
                                SortDescriptor(\ExpenseItem.amount),
                                SortDescriptor(\ExpenseItem.name)
                            ]
                        }
                    }
                }
            }
        }
    }

    var expenses: [ExpenseItem] {
        unsortedExpenses.sorted(using: sortOrder)
    }

    var filteredExpenses: [ExpenseItem] {
        switch filterType {
        case .all:
            return expenses
        case .personal:
            return expenses.filter { $0.type == "Personal" }
        case .business:
            return expenses.filter { $0.type == "Business" }
        }
    }

    func delete(_ offsets: IndexSet, from items: [ExpenseItem]) {
        for offset in offsets {
            let item = items[offset]
            modelContext.delete(item)
        }
    }

    func ListGen(item: ExpenseItem) -> some View {
        HStack {
            VStack(alignment: .leading) {
                Text(item.name)
                    .font(.headline)
                Text(item.type)
                    .foregroundStyle(.secondary)
            }

            Spacer()

            Text(item.amount, format: .currency(code: item.selectedCurrency))
                .foregroundColor(colorForValue(for: item.amount))
        }
    }

    func colorForValue(for amount: Double) -> Color {
        switch amount {
        case 0..<11: return .yellow
        case 11..<101: return .blue
        default: return .red
        }
    }
}

// MARK: - Filter Type Enum

enum FilterType: String, CaseIterable {
    case all = "All"
    case personal = "Personal"
    case business = "Business"
}

#Preview {
    ContentView()
}
