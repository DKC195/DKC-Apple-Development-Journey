import Cocoa

let luckyNumbers = [7, 4, 38, 21, 16, 15, 12, 33, 31, 49]

let filtered = luckyNumbers.filter { $0%2 != 0 }
let sorted = filtered.sorted()
let mapped = sorted.map { "\($0) is a lucky number" }
let lineByLine = mapped.joined(separator: "\n")

print(lineByLine)
