import Cocoa

class User {
    var name = "DKC"
}

let user = User()
user.name = "DKC2"
print(user.name)

var user2 = User()
user.name = "DKC2"
print(user.name)

user2 = User()
print(user.name)
