import Cocoa

extension Numeric {
    func squared() -> Self {
        self * self
    }
}

let wholeNumber = 5
print(wholeNumber.squared())

struct User: Comparable {
    let name: String
    
    static func <(lhs: User, rhs: User) -> Bool {
        lhs.name < rhs.name
    }
}

let user1 = User(name: "Alice")
let user2 = User(name: "Bob")

print(user1 == user2)
print(user1 != user2)
print(user1 < user2)
