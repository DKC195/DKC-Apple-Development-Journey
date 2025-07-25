//
//  AddBookView.swift
//  Bookworm
//
//  Created by Dhiraj KC on 2025-06-24.
//

import SwiftUI

struct AddBookView: View {
    @Environment(\.modelContext) var modelContext
    @Environment(\.dismiss) var dismiss
    @State private var showingAlert = false
    
    @State private var title = ""
    @State private var author = ""
    @State private var rating = 3
    @State private var genre = "Fantasy"
    @State private var review = ""
    
    let genres = ["Fantasy", "Horror", "Kids", "Mystery", "Poetry", "Romance", "Thriller"]
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Name of Book", text: $title)
                    TextField("Author Name", text: $author)
                    
                    Picker("Genre", selection: $genre) {
                        ForEach(genres, id: \.self) {
                            Text($0)
                        }
                    }
                }
                Section("Write a review") {
                    TextEditor(text: $review)
                    
                    RatingView(rating: $rating)
                }
                
                Section {
                    Button("Save") {
                        let newBook = Book(title: title, author: author, genre: genre, review: review, rating: rating)
                        if newBook.isValid() {
                            modelContext.insert(newBook)
                            dismiss()
                        } else {
                            showingAlert = true
                        }
                    }
                }
            }
            
        }
        .navigationTitle("Add Book")
        .alert("Error", isPresented: $showingAlert) {
            Button("Ok", role: .cancel) { }
        } message: {
            Text("There is an empty field.")
        }
    }
}

#Preview {
    AddBookView()
}
