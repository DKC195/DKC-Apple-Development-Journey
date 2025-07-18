//
//  ContentView.swift
//  FriendFace
//
//  Created by Dhiraj KC on 2025-07-18.
//

import SwiftUI

struct ContentView: View {
    @State private var users = [User]()
    
    var body: some View {
        NavigationStack {
            List(users, id: \.id) { user in
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
        }
        
    }
    
    func fetchData() {
        print("Fetching data...")
        
        guard let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json") else {
            print("Invalid URL")
            return
        }
        
        print("URL: \(url)")
        
        URLSession.shared.dataTask(with: url) {data, response, error in
            let response = response as! HTTPURLResponse
            print("Status code: \(response.statusCode)")
            
            if let data = data {
                do {
                    let decoder = JSONDecoder()
                    decoder.dateDecodingStrategy = .iso8601
                    
                    let decoded = try decoder.decode([User].self, from: data)
                    DispatchQueue.main.async {
                        self.users = decoded
                    }
                } catch {
                    print("Decoding error: \(error)")
                }
            } else if let error = error {
                print("Error: \(error.localizedDescription)")
            }
        }.resume()
    }
}

#Preview {
    ContentView()
}
