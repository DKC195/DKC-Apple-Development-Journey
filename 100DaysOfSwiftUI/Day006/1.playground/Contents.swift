import Cocoa

let platforms = ["macOS", "iOS", "tvOS", "watchOS"]

for os in platforms {
    print("Swift works on \(os)!")
}

for i in 1...12 {
    print("5 x \(i) is \(5 * i)")
}

for i in 1...12 {
    print("The \(i) times table:")
    
    for j in 1...12 {
        print("    \(j) x \(i) is \(j * i)")
    }
    print()
}

for i in 1...5 {
    print("Counting from 1 through 5: \(i)")
}

for i in 1..<5 {
    print("Counting from 1 through 5: \(i)")
}

var lyric = "Haters gonna"

for _ in 0..<5 {
    lyric += " hate"
}

print(lyric)
