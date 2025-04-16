import Cocoa

var employee = ["Dhiraj KC", "Developer", "Nepal"]
print("Name: \(employee[0])")
//employee.remove(at: 1)
print("Designation: \(employee[1])")
print("Country: \(employee[2])")

let employee2 = [
    "name": "Dhiraj KC",
    "job": "Singer",
    "country": "Nepal"
]

print(employee2["name", default: "Unknown"])
print(employee2["job", default: "Unknown"])
print(employee2["country", default: "Unknown"])

let hasGraduated = [
    "Dhiraj": false,
    "Sudip": true,
    "Sunil": true
]

let olympics = [
    2012: "London",
    2016: "Rio",
    2020: "Tokyo"
]

print(olympics[2012, default: "Unknown"])

var heights = [String: Int]()
heights["Dhiraj"] = 168
heights["Sudip"] = 175
heights["Sunil"] = 180

var archEnemies = [String: String]()
archEnemies["Batman"] = "The Jocker"
archEnemies["Superman"] = "Lex Luthor"
archEnemies["Batman"] = "Penguin"
print(archEnemies)
