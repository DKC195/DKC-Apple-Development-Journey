import Cocoa

extension Collection {
    var isNotEmpty: Bool {
        isEmpty == false
    }
}

let guests = ["Mario", "Luigi", "Peach"]

if guests.isNotEmpty {
    print("Guest count: \(guests.count)")
}

protocol Person {
    var name: String { get }
    func sayHello()
}

extension Person {
    func sayHello() {
        print("Hello, my name is \(name).")
    }
}

struct Employee: Person {
    var name: String
}

let DKC = Employee(name: "Dhiraj KC")
DKC.sayHello()
