//
//  Job.swift
//  SwiftDataProject
//
//  Created by Dhiraj KC on 2025-07-12.
//

import SwiftData
import Foundation

@Model
class Job {
    var name: String
    var priority: Int
    var owner: User?
    
    init(name: String, priority: Int, owner: User? = nil) {
        self.name = name
        self.priority = priority
        self.owner = owner
    }
}
