// WAP to read the distance between two cities (in km) and display the distance in meters, feet, inches and centimeters.
while true {
    print("Enter a number:")
    if let input = readLine(), let number: Double = Double(input) {
        let meters: Double = number * 1000
        let feet: Double = number * 3280.84
        let inches: Double = feet * 12
        let centimeters: Double = meters * 100

        print("Distance in meters: \(meters)")
        print("Distance in feet: \(feet)")
        print("Distance in inches: \(inches)")
        print("Distance in centimeters: \(centimeters)")
        break
    } else {
        print("Invalid input. Please enter a valid number.")
    }
}
