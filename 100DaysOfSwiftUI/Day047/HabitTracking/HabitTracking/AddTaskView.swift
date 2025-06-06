//
//  AddTaskView.swift
//  HabitTracking
//
//  Created by Dhiraj KC on 2025-06-05.
//

import SwiftUI

struct AddTaskView: View {
    @Environment(\.dismiss) var dismiss
    
    let habitTypes: [HabitType]
    @State private var task = Habit()
    
    var routine: Routine
    
    var body: some View {
        NavigationView {
            List{
                TextField("Activity", text: $task.name)
                Picker(selection: $task.selectedTypeId, label: Text("Type: \(habitTypes[task.selectedTypeId].name)")) {
                    ForEach(habitTypes) { type in
                        Text(type.name).tag(type.id)
                    }
                }
                TextField("Duration (minutes)", value: $task.amount, format: .number)
            }
            .navigationTitle("Add Activity")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                Button("Save") {
                    routine.tasks.append(task)
                    dismiss()
                }
            }
        }
    }
}

#Preview {
    let HabitTypes: [HabitType] = Bundle.main.decode([HabitType].self, from: "habitTypes.json")
    AddTaskView(habitTypes: HabitTypes, routine: Routine())
}
