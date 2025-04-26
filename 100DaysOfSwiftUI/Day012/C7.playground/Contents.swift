import Cocoa

class Animal {
    var legs: Int

    init(legs: Int) {
        self.legs = legs
    }
}

class Dog: Animal {
    func speak() {
        print("Woof! I'm a dog.")
    }
}

class Corgi: Dog {
    override func speak() {
        print("Yip! I'm a Corgi.")
    }
}

class Poodle: Dog {
    override func speak() {
        print("Arf! I'm a fancy Poodle.")
    }
}

class Cat: Animal {
    var isTame: Bool

    init(legs: Int, isTame: Bool) {
        self.isTame = isTame
        super.init(legs: legs)
    }

    func speak() {
        print("Meow! I'm a cat.")
    }
}

class Persian: Cat {
    override func speak() {
        print("Purr... I'm a Persian cat.")
    }
}

class Lion: Cat {
    override func speak() {
        print("Roar! I'm a wild Lion.")
    }
}
