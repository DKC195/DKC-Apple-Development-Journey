import Cocoa

var quote = "    The truth is rarely pure and never simple.   "
let trimmed = quote.trimmingCharacters(in: .whitespacesAndNewlines)

print(quote)
print(trimmed)

extension String {
    func trimmed() -> String {
        self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
    
    mutating func trim() {
        self = self.trimmed()
    }
    
    var lines: [String] {
        self.components(separatedBy: .newlines)
    }
}

func trim(_ string: String) -> String {
    string.trimmingCharacters(in: .whitespacesAndNewlines)
}

print(trim(quote))
print(quote.trimmed())


let text = """
It applies lumped element theory.
It applies distributed circuit theory.
"""

print(text.lines.count)

struct Book {
    let title: String
    let pageCount: Int
    let readingHours: Int
}

extension Book {
    init(title: String, pageCount: Int) {
        self.title = title
        self.pageCount = pageCount
        self.readingHours = pageCount / 50
    }
}

let lotr = Book(title: "Lord of the Rings", pageCount: 1178, readingHours: 24)
