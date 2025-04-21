import Cocoa

let value: Double = 999

enum MyError: Error {
    case outOfBounds
    case noRoot
}

func squareRoot(_ value: Double, tolorance: Double = 0.0001) throws -> Double {
    print("Processing Started...")
    
    if value < 1 || value > 10_000 { throw MyError.outOfBounds }
    else if value == 0 { return 0 }
    else if value == 1 { return 1 }
    else if value > 1 {
        var difference: Double = value
        var x = value / 2
        var prevX: Double = x
        while difference > tolorance {
            x = (x + value / x) / 2
            difference = abs(x - prevX)
            print(x)
            prevX = x
        }
        print("Processing Complete")
        return x
    } else { throw MyError.noRoot}
}

do {
    let result = try squareRoot(value)
    print("Result = \(Int(result))")
} catch {
    print("Error Processing: \(error)")
}
