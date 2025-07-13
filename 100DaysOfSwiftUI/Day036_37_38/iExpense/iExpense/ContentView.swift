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
    @Query var expenses: [ExpenseItem]
    
    @State private var showingAddExpense = false
    
    var body: some View {
        NavigationStack {
            List {
                Section("Personal") {
                    ForEach(personalExpenses) { item in
                        ListGen(item: item)
                    }
                    .onDelete { offsets in
                        delete(offsets, from: personalExpenses)
                    }
                }

                Section("Business") {
                    ForEach(businessExpenses) { item in
                        ListGen(item: item)
                    }
                    .onDelete { offsets in
                        delete(offsets, from: businessExpenses)
                    }
                }
            }
            .navigationTitle("iExpense")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                NavigationLink(destination: AddView()) {
                    Text("Add Expense")
                }
            }
        }
    }
    
    var personalExpenses: [ExpenseItem] {
        expenses.filter { $0.type == "Personal" }
    }

    var businessExpenses: [ExpenseItem] {
        expenses.filter { $0.type == "Business" }
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
                Text("\(item.name)")
                    .font(.headline)
                
                Text(item.type)
            }
            
            Spacer()
            
            Text(item.amount, format: .currency(code: item.selectedCurrency))
                .foregroundColor(colorForValue(for: item.amount))
        }
    }
    
    func colorForValue(for amount: Double) -> Color {
        switch amount {
        case 0..<11:
            return .yellow   // Low
        case 11..<101:
            return .blue     // Medium
        default:
            return .red      // High
        }
    }
}

#Preview {
    ContentView()
}
