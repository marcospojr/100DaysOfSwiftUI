import UIKit

// Criando Crosures básicas

let driving = {
    print("I'm driving in my car")
}

//driving()



// Aceitando parâmetros em uma Closure

//let driving2 = { (place: String) in
//    print("I'm going to \(place) in my car")
//}
//
//driving2("London")



// Retornando valores de uma Closure

//let drivingWithReturn = { (place: String) -> String in
//    return "I'm going to \(place) in my car"
//}
//
//let message = drivingWithReturn("London")
//print(message)



// Closures como parâmetros

//func travel(action: () -> Void) {
//    print("I'm getting ready to go.")
//    action()
//    print("I arrived!")
//}
//
//travel(action: driving)



// Sintaxe de Trailing Closure

func travel2(action: () -> Void) {
    print("I'm getting ready to go.")
    action()
    print("I arrived!")
}

travel2() {
    print("I'm driving in my car")
}

travel2 {
    print("I'm driving in my car")
}
