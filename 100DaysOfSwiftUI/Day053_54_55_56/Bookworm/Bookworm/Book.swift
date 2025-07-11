//
//  Book.swift
//  Bookworm
//
//  Created by Dhiraj KC on 2025-06-24.
//

import Foundation
import SwiftData

@Model
class Book {
    var title: String
    var author: String
    var genre: String
    var review: String
    var rating: Int
    var dateAdded: Date
    
    init(title: String, author: String, genre: String, review: String, rating: Int) {
        self.title = title
        self.author = author
        self.genre = genre
        self.review = review
        self.rating = rating
        self.dateAdded = Date()
    }
    
    func isValid() -> Bool {
        !title.trimmingCharacters(in: .whitespaces).isEmpty &&
        !author.trimmingCharacters(in: .whitespaces).isEmpty &&
        !genre.trimmingCharacters(in: .whitespaces).isEmpty
    }
}
