import Cocoa

var beatles = ["John", "Paul", "George", "Ringo"]
let numbers = [4, 8, 15, 16, 23, 42]
var temperatures = [25.3, 28.2, 26.4]

print(beatles[0])
print(numbers[1])
print(temperatures[2])

beatles.append("Sudip")
beatles.append("Basanta")

//temperatures.append("Chris")

var scores = Array<Int>()
scores.append(100)
scores.append(90)
scores.append(80)
print(scores[1])

//var albums = Array<String>()
var albums = [String]()
albums.append("Folklore")
albums.append("Fearless")
albums.append("Red")
print(albums.count)

var characters = ["DKC", "Sudip", "Basanta", "Sunil"]
print(characters.count)

characters.remove(at: 2)
print(characters)

characters.removeAll()
print(characters.count)

let bontMovies = ["Casino Royale", "GoldenEye", "Spectre"]
print(bontMovies.contains("Frozen"))

let cities = ["London", "New York", "Paris", "Rome"]
print(cities.sorted())

let presidents = ["Bush", "Obama", "Trump"]
let reversedPresidents = presidents.reversed()
print(reversedPresidents)
