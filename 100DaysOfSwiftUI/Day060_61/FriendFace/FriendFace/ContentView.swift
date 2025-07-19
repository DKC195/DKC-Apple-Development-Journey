//
//  ContentView.swift
//  FriendFace
//
//  Created by Dhiraj KC on 2025-07-18.
//

import SwiftData
import SwiftUI

struct ContentView: View {
    @Environment(\.modelContext) var modelContext
    
    @State private var usersTemp = [User]()
    
    @Query var users: [User]
    
    var body: some View {
        NavigationStack {
            List(usersTemp, id: \.id) { user in
                NavigationLink(destination: DetailView(user: user)) {
                    VStack(alignment: .leading) {
                        Text(user.name).font(.headline)
                        Text(user.email).font(.subheadline).foregroundColor(.secondary)
                    }
                }
            }
            .navigationBarTitle("Friend Face")
            .toolbar {
                Button("Update") {
                    fetchData()
                }
            }
            .onAppear {
                usersTemp = users
            }
        }
        
    }
    
    func fetchData() {
        guard let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json") else {
            print("Invalid URL")
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                do {
                    let decoder = JSONDecoder()
                    decoder.dateDecodingStrategy = .iso8601
                    
                    let decoded = try decoder.decode([User].self, from: data)
                    DispatchQueue.main.async {
                        self.usersTemp = decoded
                        
                        // Save to SwiftData
                        for userTemp in decoded {
                            modelContext.insert(userTemp)
                        }
                        
                        do {
                            try modelContext.save()
                        } catch {
                            print("Failed to save: \(error)")
                        }
                    }
                } catch {
                    print("Decoding error: \(error)")
                }
            }
        }.resume()
    }
}

#Preview {
    ContentView()
}
