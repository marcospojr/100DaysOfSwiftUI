import UIKit

// Manipulando dados não existentes

//var age: Int? = nil
//
//age = 38



// Desembrulhando Optionals (Unwrapping)

//var name: String? = nil
//
//if let unwrapped = name {
//    print("\(unwrapped.count) letters")
//} else {
//    print("Missing name")
//}



// Desembrulhando com guard

func greet(_ name: String?) {
    guard let unwrapped = name else {
        print("You didn't provide a name!")
        return
    }
    
//    print("Hello, \(unwrapped)!")
}

greet("Marcos")



// Forçar o desembrulhar (unwrapping)

let str = "5"
let num = Int(str)!



// Optionals implicitamente desembrulhados

let age: Int! = nil



// Operador de coalescência nil
// (nil coalescing)

func username(for id: Int) -> String? {
    if id == 1 {
        return "Taylor Swift"
    } else {
        return nil
    }
}

let user = username(for: 15) ?? "Anonymous"



// Encadeamento de optional

let names = ["John", "Paul", "George", "Ringo"]
let beatle = names.first?.uppercased()



// Optional Try

//enum PasswordError: Error {
//    case obvious
//}
//
//func checkPassword(_ password: String) throws -> Bool {
//    if password == "password" {
//        throw PasswordError.obvious
//    }
//
//    return true
//}
//
//do {
//    try checkPassword("password")
//    print("That password is good!")
//} catch {
//    print("You can't use that password.")
//}
//
//if let result = try? checkPassword("password") {
//    print("Result was \(result)")
//} else {
//    print("D'oh.")
//}
//
//try! checkPassword("sekrit")
//print("OK!")



// Inicializadores disponíveis

struct Person {
    var id: String
    
    init?(id: String) {
        if id.count == 9 {
            self.id = id
        } else {
            return nil
        }
    }
}



// Typecasting

class Animal { }
class Fish: Animal { }

class Dog: Animal {
    func makeNoise() {
        print("Woof!")
    }
}

let pets = [Fish(), Dog(), Fish(), Dog()]

for pet in pets {
    if let dog = pet as? Dog {
        dog.makeNoise()
    }
}
