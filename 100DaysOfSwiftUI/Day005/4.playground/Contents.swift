import Cocoa

let age = 18

let canVote = age >= 18 ? "Yes" : "No"

print(canVote)

let hour = 23

print(hour < 12 ? "It's before noon" : "It's after noon")

if hour < 12 {
    print("It's before noon")
} else {
    print("It's after noon")
}

let names = ["Dhiraj", "Sudip", "Sunil"]
let crewCount = names.isEmpty ? "No One" : "\(names.count) people"
print(crewCount)

enum Theme {
    case light, dark
}

let theme = Theme.dark

let backgrond = theme == .dark ? "black" : "white"
print(backgrond)
