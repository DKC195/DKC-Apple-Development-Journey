//
//  ContentView.swift
//  HabitTracking
//
//  Created by Dhiraj KC on 2025-06-05.
//

import SwiftUI

@Observable
class Routine {
    var tasks = [Habit]() {
        didSet {
            if let encoded = try? JSONEncoder().encode(tasks) {
                UserDefaults.standard.set(encoded, forKey: "tasks")
            }
        }
    }
    
    init() {
        if let savedItems = UserDefaults.standard.data(forKey: "tasks") {
            if let decoded = try? JSONDecoder().decode([Habit].self, from: savedItems) {
                tasks = decoded
                return
            }
        }
        
        tasks = []
    }
}

struct ContentView: View {
    let habitTypes: [HabitType] = Bundle.main.decode([HabitType].self, from: "habitTypes.json")
    
    @State private var routine = Routine()
    @State private var path = NavigationPath()
    
    enum Screen: Hashable {
        case info
        case add
    }

    var body: some View {
        NavigationStack(path: $path) {
            List {
                ForEach(routine.tasks) { task in
                    HStack{
                        Text(task.name)
                        Spacer()
                        Text("\(task.amount) Min")
                    }
                }
                .onDelete(perform: deleteItem)
            }
            .navigationTitle("HabitTracking")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Add Task") {
                        path.append(Screen.add)
                    }
                }
                ToolbarItem(placement: .topBarLeading) {
                    Button("Info") {
                        path.append(Screen.info)
                    }
                }
            }
            .navigationDestination(for: Screen.self) { screen in
                switch screen {
                case .info:
                    InfoView(habitTypes: habitTypes)
                case .add:
                    AddTaskView(habitTypes: habitTypes, routine: routine)
                }
            }
        }
    }
    
    func deleteItem(at offset: IndexSet) {
        routine.tasks.remove(atOffsets: offset)
    }
}

#Preview {
    ContentView()
}
