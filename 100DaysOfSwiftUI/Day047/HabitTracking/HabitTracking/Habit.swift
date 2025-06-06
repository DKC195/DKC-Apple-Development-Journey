//
//  Expenses.swift
//  HabitTracking
//
//  Created by Dhiraj KC on 2025-06-05.
//

import Foundation

struct Habit: Identifiable, Codable {
    var id = UUID()
    var name: String
    var amount: Int
    var selectedTypeId: Int
    
    init() {
        self.name = ""
        self.amount = 0
        self.selectedTypeId = 1
    }
}

struct HabitType: Identifiable, Codable {
    var id: Int
    var name: String
    var description: String
}

extension Bundle {
    func decode<T: Decodable>(_ type: T.Type, from file: String) -> T {
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("❌ Failed to locate \(file) in bundle.")
        }

        guard let data = try? Data(contentsOf: url) else {
            fatalError("❌ Failed to load \(file) from bundle.")
        }

        let decoder = JSONDecoder()

        do {
            return try decoder.decode(T.self, from: data)
        } catch {
            print("❌ Decoding error: \(error)")
            fatalError("❌ Failed to decode \(file) from bundle.")
        }
    }
}
