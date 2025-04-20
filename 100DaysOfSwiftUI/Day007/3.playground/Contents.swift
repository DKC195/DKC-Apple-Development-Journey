import Cocoa

func isUppercase(string: String) -> Bool {
    string == string.uppercased()
}

print(isUppercase(string: "S"))

func getUser() -> [String] {
    ["Dhiraj", "KC"]
}

let user = getUser()
print("Name: \(user[0]) \(user[1])")

func getUser2() -> [String: String] {
    ["firstName": "Dhiraj", "lastName": "KC"]
}

let user2 = getUser2()
print("Name: \(user2["firstName", default: "?"]) \(user2["lastName", default: "?"])")

func getUser3() -> (firstName: String, lastName: String) {
    ("Dhiraj", "KC")
}

let user3 = getUser3()
print("Name: \(user3.firstName) \(user3.lastName)")

func getUser4() -> (String, String) {
    ("Dhiraj", "KC")
}

let user4 = getUser4()
print("Name: \(user4.0) \(user4.1)")

let firstName = user3.firstName
let lastName = user3.lastName

print("Name: \(firstName) \(lastName)")


let (firstName1, lastName1) = getUser4()
print("Name: \(firstName1) \(lastName1)")
