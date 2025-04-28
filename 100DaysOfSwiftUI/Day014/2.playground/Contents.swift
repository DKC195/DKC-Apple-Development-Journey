import Cocoa

func printSquare(of number: Int?) {
    guard let number = number else {
        print("Missing Input")
        return
    }
    
    print("Square of \(number) is \(number * number)")
}

var myVar: Int? = 5
if let unwrapped = myVar {
    
}
