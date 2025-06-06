//
//  InfoView.swift
//  HabitTracking
//
//  Created by Dhiraj KC on 2025-06-07.
//

import SwiftUI

struct InfoView: View {
    let habitTypes: [HabitType]
    
    init(habitTypes: [HabitType]) {
        self.habitTypes = habitTypes
    }
    
    var body: some View {
        List {
            ForEach(habitTypes) { habitType in
                Section(habitType.name) {
                    Text(habitType.description)
                }
            }
        }
        .navigationTitle("Info")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    let HabitTypes: [HabitType] = Bundle.main.decode([HabitType].self, from: "habitTypes.json")
    InfoView(habitTypes: HabitTypes)
}
