// WAP to read 3 numbers and find the middle number.

var num1: Int = 0
var num2: Int = 0
var num3: Int = 0

while true {
    print("Enter 1st number: ")
    if let input = readLine(), let number = Int(input) {
        num1 = number
        break
    } else {
        print("Invalid input")
    }
}

while true {
    print("Enter 2nd number: ")
    if let input = readLine(), let number = Int(input) {
        num2 = number
        break
    } else {
        print("Invalid input")
    }
}

while true {
    print("Enter 3rd number: ")
    if let input = readLine(), let number = Int(input) {
        num3 = number
        break
    } else {
        print("Invalid input")
    }
}

if num1 < num2 && num2 < num3 {
    print("\(num2) is the middle number")
} else if num2 < num1 && num1 < num3 {
    print("\(num1) is the middle number")
} else {
    print("\(num3) is the middle number")
}
