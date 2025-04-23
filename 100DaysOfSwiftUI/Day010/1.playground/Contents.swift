import Cocoa

struct Album {
    let title: String
    let artist: String
    let year: Int
    
    func printSummary() {
        print("\(title) (\(year)) by \(artist)")
    }
}

let red = Album(title: "Red", artist: "Taylor Swift", year: 2012)
let wings = Album(title: "Wings", artist: "BTS", year: 2016)

print(red.title)
print(wings.artist)

red.printSummary()
wings.printSummary()

struct Employee {
    let name: String
    var vacationRemaining: Int = 14
    
    mutating func takeVacation(days: Int) {
        if vacationRemaining >= days {
            vacationRemaining -= days
            print("I am going on vacation!")
            print("Vacation remaining: \(vacationRemaining)")
        } else {
            print("Not enough vacation days remaining.")
        }
    }
}

var archer = Employee(name: "Sudip Archer", vacationRemaining: 20)
//let archer = Employee(name: "Sudip Archer", vacationRemaining: 20)
archer.takeVacation(days: 5)
print(archer.vacationRemaining)

let a = 1
let b = 2.0
let c = Double(a) + b

var kane = Employee(name: "Basu Kane")
kane.takeVacation(days: 5)
print(kane.vacationRemaining)
