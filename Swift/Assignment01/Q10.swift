// WAP to read time into the second and convert it into hour, minute and second.

import Foundation

var sec: Int = 0
var min: Int = 0
var hr: Int = 0

while true {
    print("Enter time in seconds:")
    if let input = readLine(), let number: Int = Int(input) {
        sec = number
        break
    } else {
        print("Invalid input. Please enter a valid number.")
    }
}

min = sec / 60
sec = sec % 60
hr = min / 60
min = min % 60

print("Time is \(hr) hours, \(min) minutes and \(sec) seconds.")
