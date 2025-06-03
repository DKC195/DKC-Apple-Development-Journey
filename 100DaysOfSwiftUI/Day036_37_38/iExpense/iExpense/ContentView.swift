//
//  ContentView.swift
//  iExpense
//
//  Created by Dhiraj KC on 2025-05-25.
//

import SwiftUI

struct ExpenseItem: Identifiable, Codable {
    var id = UUID()
    let name: String
    let type: String
    let selectedCurrency: String
    let amount: Double
}

@Observable
class Expenses {
    var items = [ExpenseItem]() {
        didSet {
            if let encoded = try? JSONEncoder().encode(items) {
                UserDefaults.standard.set(encoded, forKey: "items")
            }
        }
    }
    
    init() {
        if let savedItems = UserDefaults.standard.data(forKey: "items") {
            if let decodedItems = try? JSONDecoder().decode([ExpenseItem].self, from: savedItems) {
                items = decodedItems
                return
            }
        }
        
        items = []
    }
}

struct ContentView: View {
    @State private var expenses = Expenses()
    
    @State private var showingAddExpense = false
    
    var body: some View {
        NavigationStack {
            List {
                Section("Personal") {
                    ForEach(expenses.items) { item in
                        if item.type == "Personal" {
                            ListGen(item: item)
                        }
                    }
                    .onDelete(perform: removeItems)
                }
                
                Section("Business") {
                    ForEach(expenses.items) { item in
                        if item.type == "Business" {
                            ListGen(item: item)
                        }
                    }
                    .onDelete(perform: removeItems)
                }
            }
            .navigationTitle("iExpense")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
//                Button("Add Expense", systemImage: "plus") {
//                    showingAddExpense = true
                    NavigationLink(destination: AddView(expenses: expenses)) {
                        Text("Add Expense")
                    }
//                }
            }
//            .sheet(isPresented: $showingAddExpense, content: {
//                AddView(expenses: expenses)
//            })
        }
    }
    
    func removeItems(at offset: IndexSet) {
        expenses.items.remove(atOffsets: offset)
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
