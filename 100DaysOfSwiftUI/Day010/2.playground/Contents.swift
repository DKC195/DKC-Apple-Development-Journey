import Cocoa

struct Employee {
    let name: String
    var vacation: Int
    var vacationTaken = 0
    
    var vacationRemaining: Int {
        get {
            vacation - vacationTaken
        }
        
        set {
            vacation = vacationTaken + newValue
        }
    }
}

var archer = Employee(name: "Archer", vacation: 10)
//archer.vacation -= 5
//print(archer.vacation)
//archer.vacation -= 5
//print(archer.vacation)

archer.vacationTaken += 5
archer.vacationRemaining = 6
print(archer.vacationRemaining)
archer.vacationTaken += 5
print(archer.vacationRemaining)


