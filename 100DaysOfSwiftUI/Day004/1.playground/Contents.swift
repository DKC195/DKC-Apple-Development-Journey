import Cocoa

let surname: String = "Lasso"
var score: Double = 0

let playerName: String = "Roy"
let luckyNuyen: Int = 13
let pi: Double = 3.141
var isAuthenticated: Bool = false

var albums: [String] = ["Red", "Fearless"]
var user: [String: String] = ["id": "@twostraws"]
var books: Set<String> = Set([
    "The Bluest Eye",
    "Foundation",
    "Girl, Woman, Other"
])

var soda: [String] = ["Coke", "Pepsi", "Irn-Bru"]
var teams: [String] = [String]()
var cities: [String] = []
var clues = [String]()

enum UIStyle {
    case light, dark, system
}

var style = UIStyle.light
style = .dark

let username: String

username = "@twostraws"
//username = "BasuChor"

print(username)

//let scores: Int = "Zero"
