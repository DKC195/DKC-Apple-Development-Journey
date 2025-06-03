//
//  ContentView.swift
//  Moonshot
//
//  Created by Dhiraj KC on 2025-05-30.
//

import SwiftUI

import SwiftUI

struct ContentView: View {
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    
    @State private var isGridView = true
    
    let columns = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    var body: some View {
        NavigationStack {
            Group {
                if isGridView {
                    ScrollView {
                        LazyVGrid(columns: columns) {
                            ForEach(missions) { mission in
                                NavigationLink {
                                    MissionView(mission: mission, astronauts: astronauts)
                                } label: {
                                    MissionCardView(mission: mission)
                                }
                            }
                        }
                        .padding([.horizontal, .bottom])
                    }
                } else {
                    List(missions) { mission in
                        NavigationLink {
                            MissionView(mission: mission, astronauts: astronauts)
                        } label: {
                            HStack(spacing: 20) {
                                Image(mission.image)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 60, height: 60)
                                    .padding(5)
                                
                                VStack(alignment: .leading) {
                                    Text(mission.displayName)
                                        .font(.headline)
                                        .foregroundStyle(.white)
                                    
                                    Text(mission.formattedLaunchDate)
                                        .font(.caption)
                                        .foregroundStyle(.white.opacity(0.7))
                                }
                            }
                            .padding(.vertical, 8)
                        }
                        .listRowBackground(Color(.lightBackground))
                    }
                    .scrollContentBackground(.hidden)
                }
            }
            .navigationTitle("Moonshot")
            .background(.darkBackground)
            .preferredColorScheme(.dark)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        isGridView.toggle()
                    } label: {
                        Label("Toggle View", systemImage: isGridView ? "list.bullet" : "square.grid.2x2")
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
