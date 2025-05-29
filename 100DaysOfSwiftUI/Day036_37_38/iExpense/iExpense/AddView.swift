//
//  AddView.swift
//  iExpense
//
//  Created by Dhiraj KC on 2025-05-27.
//

import SwiftUI

struct AddView: View {
    @Environment(\.dismiss) var dismiss
    
    @State private var name = ""
    @State private var type = "Personal"
    @State private var amount = 0.0
    @State private var selectedCurrency = "USD"
    let currencies = NSLocale.commonISOCurrencyCodes
    
    var expenses: Expenses
    
    let types = ["Business", "Personal"]
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Name", text: $name)
                
                Picker("Type", selection: $type) {
                    ForEach(types, id: \.self) {
                        Text($0)
                    }
                }
                
                Picker("Select Currency", selection: $selectedCurrency) {
                    ForEach(currencies, id: \.self) { code in
                        Text("\(currencyName(for: code)) (\(code))").tag(code)
                    }
                }
                .pickerStyle(MenuPickerStyle())
                
                TextField("Amount", value: $amount, format: .currency(code: selectedCurrency))
                    .keyboardType(.decimalPad)
                    .navigationTitle("Add new expenses")
            }
            .toolbar {
                Button("Save") {
                    let item = ExpenseItem(name: name, type: type, selectedCurrency: selectedCurrency,amount: amount)
                    expenses.items.append(item)
                    dismiss()
                }
            }
        }
    }
    
    func currencyName(for code: String) -> String {
        return Locale.current.localizedString(forCurrencyCode: code) ?? code
    }
}

#Preview {
    AddView(expenses: Expenses())
}
