import Cocoa

let names = ["Aryan", "Sudip", "DKC"]
let chosen = names.randomElement()?.uppercased() ?? "N/A"
print("Chosen name: \(chosen)")


struct Book {
    let title: String
    let author: String?
}

var book: Book? = nil
let author = book?.author?.first?.uppercased() ?? "N/A"
print(author)

