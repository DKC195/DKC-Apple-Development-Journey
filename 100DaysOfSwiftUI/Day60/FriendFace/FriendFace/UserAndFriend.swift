//
//  Friends.swift
//  FriendFace
//
//  Created by Dhiraj KC on 2025-07-18.
//

import Foundation

struct Friend: Codable, Identifiable {
    let id: UUID
    let name: String
}

struct User: Codable, Identifiable {
    let id: UUID
    let isActive: Bool
    let name: String
    let age: Int
    let company: String
    let email: String
    let address: String
    let about: String
    let registered: Date
    let tags: [String]
    let friends: [Friend]
}
