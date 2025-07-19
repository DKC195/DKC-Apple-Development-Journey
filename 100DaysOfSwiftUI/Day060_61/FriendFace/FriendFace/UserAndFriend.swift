//
//  Friends.swift
//  FriendFace
//
//  Created by Dhiraj KC on 2025-07-18.
//

import Foundation
import SwiftData


struct Friend: Codable, Identifiable {
    var id: UUID
    var name: String
}

@Model
class User: Decodable {
    var id: UUID
    var isActive: Bool
    var name: String
    var age: Int
    var company: String
    var email: String
    var address: String
    var about: String
    var registered: Date
    var tags: [String]
    var friends: [Friend]
    
    // Default SwiftData initializer
    init(id: UUID, isActive: Bool, name: String, age: Int, company: String, email: String, address: String, about: String, registered: Date, tags: [String], friends: [Friend]) {
        self.id = id
        self.isActive = isActive
        self.name = name
        self.age = age
        self.company = company
        self.email = email
        self.address = address
        self.about = about
        self.registered = registered
        self.tags = tags
        self.friends = friends
    }
    
    // Decodable initializer
    enum CodingKeys: CodingKey {
        case id, isActive, name, age, company, email, address, about, registered, tags, friends
    }
    
    required convenience init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        let id = try container.decode(UUID.self, forKey: .id)
        let isActive = try container.decode(Bool.self, forKey: .isActive)
        let name = try container.decode(String.self, forKey: .name)
        let age = try container.decode(Int.self, forKey: .age)
        let company = try container.decode(String.self, forKey: .company)
        let email = try container.decode(String.self, forKey: .email)
        let address = try container.decode(String.self, forKey: .address)
        let about = try container.decode(String.self, forKey: .about)
        let registered = try container.decode(Date.self, forKey: .registered)
        let tags = try container.decode([String].self, forKey: .tags)
        let friends = try container.decode([Friend].self, forKey: .friends)
        
        self.init(id: id, isActive: isActive, name: name, age: age, company: company, email: email, address: address, about: about, registered: registered, tags: tags, friends: friends)
    }
}
