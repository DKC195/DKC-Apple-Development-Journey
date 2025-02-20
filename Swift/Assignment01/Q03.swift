// WAP to read marks obtained by a student in five subjects. Read the full max of each subject as well. Print the percentage score by the student.
var marks: [Double] = [Double]()

print("Enter marks for 5 subjects:")
for _ in 1...5 {
    while true {
        if let input = readLine(), let mark: Double = Double(input) {
            marks.append(mark)
            break
        } else {
            print("Invalid input. Please enter a valid number.")
        }
    }
}

var totalMarks: Double = 0.0

for x: Int in 0...4 {
    totalMarks += marks[x]
}

var percentage: Double = (totalMarks / 500) * 100

print("Percentage: \(percentage)")
