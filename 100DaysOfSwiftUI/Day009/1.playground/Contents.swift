import Cocoa

func greetUser() {
    print("Hi there!")
}

greetUser()

var greetCopy = greetUser

greetCopy

let sayHello = { print("Hello!") }

sayHello()

let sayHello2 = { (name: String) -> String in
    "Hi \(name)!"
}

sayHello2("Alice")

func getUserData(for id: Int) -> String {
    if id == 1989 {
        return "John Doe"
    } else {
        return "Anynomous"
    }
}

let data: (Int) -> String = getUserData
let user = data(1989)
print(user)

let team = ["Sunil", "Dhiraj", "Basu", "Sudip", "Rijan"]
let sortedTeam = team.sorted()
print(sortedTeam)

func captainFirstSorted(name1: String, name2: String) -> Bool {
    if name1 == "Sudip" {
        return true
    } else if name2 == "Sudip" {
        return false
    }
    return name1 < name2
}

//let captainFirstTeam = team.sorted(by: captainFirstSorted)
//print(captainFirstTeam)

let captainFirstTeam = team.sorted(by: {(name1: String, name2: String) -> Bool in
    if name1 == "Sudip" {
        return true
    } else if name2 == "Sudip" {
        return false
    }
    return name1 < name2
})

print(captainFirstTeam)
