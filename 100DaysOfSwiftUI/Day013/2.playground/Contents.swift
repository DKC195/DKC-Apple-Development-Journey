import Cocoa

protocol View { }

func getRandomNumber() -> some Equatable {
    Double.random(in: 0...6)
}

func getRandomBool() -> some Equatable {
    Bool.random()
}

print(getRandomNumber() == getRandomNumber())

