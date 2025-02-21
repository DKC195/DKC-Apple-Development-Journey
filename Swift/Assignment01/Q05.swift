// The length and width of a rectangle and radius of a circle or input through the keyboard. WAP to calculate the area and perimeter of the rectangle and the area and circumference of the circle.

var length: Double = 0
var width: Double = 0
var radius: Double = 0

while true {
    print("Enter the length of the rectangle:")
    if let input = readLine(), let number: Double = Double(input) {
        length = number
        break
    } else {
        print("Invalid input. Please enter a valid number.")
    }
}

while true {
    print("Enter the width of the rectangle:")
    if let input = readLine(), let number: Double = Double(input) {
        width = number
        break
    } else {
        print("Invalid input. Please enter a valid number.")
    }
}

while true {
    print("Enter the radius of the circle:")
    if let input = readLine(), let number: Double = Double(input) {
        radius = number
        break
    } else {
        print("Invalid input. Please enter a valid number.")
    }
}

print("Area of the rectangle: \(length * width)")
print("Perimeter of the rectangle: \(2 * (length + width))")
print("Area of the circle: \(3.14 * radius * radius)")
print("Circumference of the circle: \(2 * 3.14 * radius)")
