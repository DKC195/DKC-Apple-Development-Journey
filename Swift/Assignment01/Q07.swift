// If a five digit number is input through the keyboard. Calculate the sum of its digits. Reverse the numbers. Sum of the first and last digits.

var sum: Int = 0
var newNumber: Int = 0
var firstLastSum: Int = 0

while true {
    print("Enter a five digit number: ")
    if let input = readLine(), var number: Int = Int(input) {
        for i in 1...5 {
            let digits = Int(number) % 10
            number = number / 10
            sum = sum + Int(digits)

            newNumber = newNumber * 10 + Int(digits)

            if i == 1 || i == 5 {
                firstLastSum = firstLastSum + Int(digits)
            }
        }
        break
    } else {
        print("Invalid input")
    }
}

print("Sum of the digits: \(sum)")
print("Reversed number: \(newNumber)")
print("Sum of the first and last digits: \(firstLastSum)")
