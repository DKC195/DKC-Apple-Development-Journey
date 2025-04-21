import Cocoa

func printTimesTable(for number: Int, end: Int = 12) {
    for i in 1...end {
        print("\(number) x \(i) = \(number * i)")
    }
}

printTimesTable(for: 5, end: 20)
printTimesTable(for: 8)

var characters = ["Dhiraj", "Sudip", "Rijan", "Sunil"]
print(characters.count)
characters.removeAll(keepingCapacity: true)
print(characters.count)

