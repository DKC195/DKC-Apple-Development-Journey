//
//  DetailView.swift
//  FriendFace
//
//  Created by Dhiraj KC on 2025-07-18.
//

import SwiftUI

struct DetailView: View {
    let user: User
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 12) {
                Text("Company: \(user.company)")
                Text("Address: \(user.address)")
                Text("About: \(user.about)")
                Text("Tags: \(user.tags.joined(separator: ", "))")
                
                Text("Friends:")
                    .font(.headline)
                    .padding(.top)
                
                ForEach(user.friends) { friend in
                    Text("\(friend.name)")
                }
            }
            .padding()
        }
        .navigationTitle(user.name)
    }
}
