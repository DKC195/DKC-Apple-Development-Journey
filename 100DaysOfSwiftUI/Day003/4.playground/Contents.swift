import Cocoa

var selected = "Monday"
selected = "Tuesday"
selected = "January"
selected = "Friday "

enum Weekday {
    case monday, tuesday, wednesday, thursday, friday, saturday, sunday
}

var day = Weekday.monday
day = Weekday.tuesday
//day = January
day = Weekday.friday

day = .monday
day = .tuesday
day = .friday
