//
//  Expenses.swift
//  iExpense
//
//  Created by Dhiraj KC on 2025-07-13.
//

import Foundation
import SwiftData

@Model
class ExpenseItem {
    var name: String
    var type: String
    var selectedCurrency: String
    var amount: Double
    
    init(name: String, type: String, selectedCurrency: String, amount: Double) {
        self.name = name
        self.type = type
        self.selectedCurrency = selectedCurrency
        self.amount = amount
    }
}
