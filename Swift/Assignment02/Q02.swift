// WAP to read an alphabet and convert it into Uppercase if it is lowercase and vice versa.

print("Enter an alphabet")
var alphabet: Character = "a"

while true {
    if let input = readLine(), input.count == 1, let chara = input.first {
        alphabet = chara
        break
    } else {
        print("Invalid input")
    }
}

if alphabet.isLowercase {
    print(alphabet.uppercased())
} else if alphabet.isUppercase {
    print(alphabet.lowercased())
} else {
    print("Invalid input. Please enter a valid alphabet character.")
}
