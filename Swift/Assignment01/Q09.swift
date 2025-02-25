// WAP to read two numbers and find the quotient and reminder.
var x: Int = 0
while true {
    print("Enter the First Number:")
    if let input = readLine(), let number: Int = Int(input) {
        x = number
        break
    } else {
        print("Invalid input. Please enter a valid number.")
    }
}

var y: Int = 0
while true {
    print("Enter the second Number:")
    if let input = readLine(), let number: Int = Int(input) {
        y = number
        break
    } else {
        print("Invalid input. Please enter a valid number.")
    }
}

print("The quotient is \(x/y) and The reminder is \(x%y)")
