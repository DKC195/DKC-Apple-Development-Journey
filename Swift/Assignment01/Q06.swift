// WAP to read two numbers and swap their values.

var x: Int = 0
var y: Int = 0
var temp: Int = 0

while true {
    print("Enter the First Number:")
    if let input = readLine(), let number: Int = Int(input) {
        x = number
        break
    } else {
        print("Invalid input. Please enter a valid number.")
    }
}

while true {
    print("Enter the Second Number:")
    if let input = readLine(), let number: Int = Int(input) {
        y = number
        break
    } else {
        print("Invalid input. Please enter a valid number.")
    }
}

print("Before swapping: x = \(x), y = \(y)")

temp = x
x = y
y = temp

print("After swapping: x = \(x), y = \(y)")
