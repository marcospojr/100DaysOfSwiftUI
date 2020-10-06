import UIKit

// Criando suas próprias Structs

//struct Sport {
//    var name: String
//}
//
//var tennis = Sport(name: "Tennis")
//print(tennis.name)
//
//tennis.name = "Lawn Tennis"
//print(tennis.name)



// Propriedades calculadas

struct Sport {
    var name: String
    var isOlympicSport: Bool
    
    var olympicStatus: String {
        if isOlympicSport {
            return "\(name) is an Olympic Sport"
        }
        else {
            return "\(name) is not an Olympic Sport"
        }
    }
}

let chessBoxing = Sport(name: "Chessboxing", isOlympicSport: false)

//print(chessBoxing.olympicStatus)



// Observadores de propriedades

//struct Progress {
//    var task: String
//    var amount: Int {
//        didSet {
//            print("\(task) is now \(amount)% complete")
//        }
//    }
//}
//
//var progress = Progress(task: "Loading data...", amount: 0)
//
//progress.amount = 30
//progress.amount = 80
//progress.amount = 100



// Métodos

struct City {
    var population: Int
    
    func collectTaxes () -> Int {
        return population * 1000
    }
}

let london = City(population: 9_000_000)
london.collectTaxes()



// Métodos mutantes

struct Person {
    var name: String
    
    mutating func makeAnonymous() {
        name = "Anonymous"
    }
}

var person = Person(name: "Ed")
person.makeAnonymous()
//print(person.name)



// Propriedades e métodos de Strings

//let string = "Do or do not, there is no try."
//
//print(string.count)
//print(string.hasPrefix("Do"))
//print(string.uppercased())
//print(string.sorted())



// Propriedades e métodos de Arrays

var toys = ["Woody"]

print(toys.count)

toys.append("Buzz")
toys.firstIndex(of: "Buzz")
print(toys.sorted())

toys.remove(at: 0)

