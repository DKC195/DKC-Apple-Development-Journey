import Cocoa

var intList: [Int]? = [1, 2, 3]

var number = intList?.randomElement() ?? (0...100).randomElement()

