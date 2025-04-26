import Cocoa

class Game {
    var score = 0 {
        didSet {
            print("Score: \(score)")
        }
    }
}

var newGame = Game()
newGame.score += 10
