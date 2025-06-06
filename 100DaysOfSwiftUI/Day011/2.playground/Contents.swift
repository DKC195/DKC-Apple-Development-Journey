import Cocoa

struct School {
    static var studentCount: Int = 0
    
    static func add(student: String) {
        print("\(student) is added to the school.")
        studentCount += 1
    }
}

School.add(student: "DKC")
print(School.studentCount)

struct AppData {
    static let version = "1.3 beta 2"
    static let saveFilename = "settings.json"
    static let homeURL = "https://www.hackingwithswift.com"
}

struct Employee {
    let username: String
    let password: String
    
    static let example = Employee(username: "basu", password: "basuChor")
}
