// WAP to read a year and check whether it is leap year or not. (Note: A year is leap year if it is divisible only by 4 or by 4,100 and 400)
while true {
    print("Enter the year:")
    var year: Int = 0
    if let input = readLine(), let number = Int(input) {
        year = number

        if year % 400 == 0 {
            print("It's Leap Year.")
        } else if year % 100 == 0 {
            print("It's not Leap Year.")
        } else if year % 4 == 0 {
            print("It's Leap Year.")
        } else {
            print("It's not Leap Year.")
        }
        break
    } else {
        print("Invalid Input")
    }
}
