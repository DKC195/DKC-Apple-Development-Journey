import Cocoa

/* To check your knowledge, here’s a small task for you: create a struct to store information about a car, including its model, number of seats, and current gear, then add a method to change gears up or down. Have a think about variables and access control: what data should be a variable rather than a constant, and what data should be exposed publicly? Should the gear-changing method validate its input somehow?
 
*/

struct Car {
    let model: String
    let numberOfSeats: Int
    private(set) var currentGear: Int
    
    private let maxGear = 6
    private let minGear = 1
    
    init(model: String, numberOfSeats: Int, currentGear: Int = 1) {
        self.model = model
        self.numberOfSeats = numberOfSeats
        self.currentGear = max(minGear, min(currentGear, maxGear))
    }
    
    mutating func changeGear(up: Bool) {
        if up {
            if currentGear < maxGear {
                currentGear += 1
                print("Shifted up to gear \(currentGear)")
            } else {
                print("Already at maximum gear.")
            }
        } else {
            if currentGear > minGear {
                currentGear -= 1
                print("Shifted down to gear \(currentGear)")
            } else {
                print("Already at minimum gear.")
            }
        }
    }
}

var car = Car(model: "Aventador", numberOfSeats: 2)
car.changeGear(up: true)   // Gear 2
car.changeGear(up: false)  // Gear 1
car.changeGear(up: false)  // Already at minimum gear.





