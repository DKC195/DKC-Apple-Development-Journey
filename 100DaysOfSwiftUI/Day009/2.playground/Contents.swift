import Cocoa

let team = ["Sunil", "Dhiraj", "Basu", "Sudip", "Rijan"]

let captainFirstTeam = team.sorted{
    if $0 == "Sudip" {
        return true
    } else if $1 == "Sudip" {
        return false
    }
    return $0 < $1
}

print(captainFirstTeam)

let reverseTeam = team.sorted{$0 > $1}
print(reverseTeam)

let sOnly = team.filter{$0.hasPrefix("S")}
print(sOnly)

let uppercaseTeam = team.map{$0.uppercased()}
print(uppercaseTeam)
