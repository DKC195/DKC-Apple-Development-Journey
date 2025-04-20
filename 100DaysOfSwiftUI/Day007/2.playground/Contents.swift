import Cocoa

let root = sqrt(169)

print(root)

func rollDice() -> Int {
    return Int.random(in: 1...6)
}

let result = rollDice()
print(result)

//func checkDups(first: String, second: String) -> Bool {
//    if first == second {
//        return true
//    } else {
//        return false
//    }
//}

func areLetterIdentical(first: String, second: String) -> Bool {
    return first.sorted() == second.sorted()
}

print(areLetterIdentical(first: "Hello", second: "Hello"))

func pythogoreanTheorem(a: Double, b: Double) -> Double {
    return sqrt(a * a + b * b)
}

let c = pythogoreanTheorem(a: 3, b: 4)
print(c)
