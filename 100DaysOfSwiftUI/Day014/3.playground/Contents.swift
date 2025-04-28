import Cocoa

let captains = [
    "Enterprise": "Picard",
    "Voyager": "Seymour",
    "Deep Space Nine": "Worf"
]

let new = captains["Serenity"] ?? "Unknown"

let tvShows = ["Naruto", "Attack on Titan", "Fullmetal Alchemist"]
let favourite = tvShows.randomElement() ?? "Unknown"

struct Book {
    let title: String
    let author: String
}

let book = Book(title: "Physics", author: nil)
let author = book.author ?? "Unknown"
print(author)
