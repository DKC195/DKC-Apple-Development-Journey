//WAP to find all possible roots of a quadratic equation ax^2 + bx + c =0.
import Foundation

print("Enter the coefficients a, b, and c for the quadratic equation (ax^2 + bx + c = 0):")

var a: Double = 0
var b: Double = 0
var c: Double = 0

func getInput(for variable: String) -> Double {
    while true {
        print("Enter \(variable):")
        if let input = readLine(), let number = Double(input) {
            return number
        } else {
            print("Invalid input. Please enter a valid number.")
        }
    }
}

a = getInput(for: "a")
b = getInput(for: "b")
c = getInput(for: "c")

func solveQuadratic(a: Double, b: Double, c: Double) {
    if a == 0 {
        if b == 0 {
            print(c == 0 ? "Infinite solutions exist." : "No solution exists.")
        } else {
            let root = -c / b
            print("This is a linear equation. The solution is: \(root)")
        }
        return
    }

    let discriminant = b * b - 4 * a * c

    if discriminant > 0 {
        let root1 = (-b + sqrt(discriminant)) / (2 * a)
        let root2 = (-b - sqrt(discriminant)) / (2 * a)
        print(
            "Roots are real and distinct: \(String(format: "%.5f", root1)) and \(String(format: "%.5f", root2))"
        )
    } else if discriminant == 0 {
        let root = -b / (2 * a)
        print("Roots are real and equal: \(String(format: "%.5f", root))")
    } else {
        let realPart = -b / (2 * a)
        let imaginaryPart = sqrt(-discriminant) / (2 * a)
        print(
            "Roots are complex: \(String(format: "%.5f", realPart)) ± \(String(format: "%.5f", imaginaryPart))i"
        )
    }
}

solveQuadratic(a: a, b: b, c: c)
