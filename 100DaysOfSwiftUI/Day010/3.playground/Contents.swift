import Cocoa

struct Game {
    var score: Int = 0 {
        didSet {
            print("Score is now \(score)")
        }
    }
}

var game = Game()
game.score += 10
game.score -= 3
game.score += 10

struct App {
    var contacts = [String]() {
        willSet {
            print("Current value is: \(contacts)")
            print("New value will be: \(newValue)")
        }
        
        didSet {
            print("There are now \(contacts.count) contacts.")
            print("Old value was: \(oldValue)")
        }
    }
}

var app = App()
app.contacts.append("Sudip")
app.contacts.append("Basu")
app.contacts.append("DKC")
