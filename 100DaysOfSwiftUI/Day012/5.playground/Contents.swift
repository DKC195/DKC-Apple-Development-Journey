import Cocoa

class User {
    let id: Int
    
    init(id: Int) {
        self.id = id
        print("User \(id) initialized")
    }
    
    deinit {
        print("User \(id) deinitialized")
    }
}

var users = [User]()

for i in 1...3 {
    let user = User(id: i)
    print("User \(i) created")
    users.append(user)
}

print("Loop is finished")
users.removeAll()
print("Memory released")
