import Cocoa

class User {
    var username = "Anonymous"
    
    func copy() -> User {
        let user = User()
        user.username = username
        return user
    }
}

var user1 = User()
var user2 = user1.copy()

user2.username = "DKC"

print(user1.username)
print(user2.username)
