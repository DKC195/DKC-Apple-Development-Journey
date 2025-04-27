import Cocoa

protocol building {
    var room: Int { get }
    var cost: Int { get }
    var agent: String { get set }
    
    func salesSummary() -> String
}

extension building {
    func salesSummary() -> String {
        return "Room: \(room), Cost: \(cost), Agent: \(agent)"
    }
}

struct House: building {
    var room: Int
    var cost: Int
    var agent: String
}

struct Office: building {
    var room: Int
    var cost: Int
    var agent: String
}

let myHouse = House(room: 4, cost: 500_000, agent: "DKC")
let myOffice = Office(room: 5, cost: 1_000_000, agent: "SP")

print(myHouse.salesSummary())
print(myOffice.salesSummary())
