// WAP to read temperature in Fahrenheit and convert it into centigrade. C=5/9(F-32)
var celsius: Double

print("Enter temperature in Fahrenheit:")

while true {
    if let input = readLine(), let number: Double = Double(input) {
        celsius = (number - 32) / 1.8
        print("Temperature in Celsius: \(celsius)")
        break
    } else {
        print("Invalid input. Please enter a valid number.")
    }
}
