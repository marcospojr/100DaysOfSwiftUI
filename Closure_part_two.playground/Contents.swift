import UIKit

// Utilizando Closures como parâmetros quando
// elas aceitam parâmetros

func travel(action: (String) -> Void) {
    print("I'm getting ready to go.")
    action("London")
    print("I arrived!")
}

travel { (place: String) in
    print("I'm going to \(place) in my car")
}



// Utilizando Closures como parâmetros quando
// elas retornam parâmetros

func travel2(action: (String) -> String) {
    print("I'm getting ready to go.")
    let description = action("London")
    print(description)
    print("I arrived!")
}

travel2 { (place: String) -> String in
    return "I'm going to \(place) in my car"
}



// Nomes de parâmetros abreviados

func travel3(action: (String) -> String) {
    print("I'm getting ready to go.")
    let description = action("London")
    print(description)
    print("I arrived!")
}

travel3 { (place: String) -> String in
    return "I'm going to \(place) in my car"
}

travel3 { place -> String in
    return "I'm going to \(place) in my car"
}

travel3 { place in
    return "I'm going to \(place) in my car"
}

travel3 { place in
    "I'm going to \(place) in my car"
}

travel3 {
    "I'm going to \($0) in my car"
}



// Closures com múltiplos parâmetros

func travel4(action: (String, Int) -> String) {
    print("I'm getting ready to go.")
    let description = action("London", 60)
    print(description)
    print("I arrived!")
}

travel4 {
    "I'm going to \($0) at \($1) miles per hour."
}



// Retornando Closures de funções

func travel5() -> (String) -> Void {
    return {
        print("I'm going to \($0)")
    }
}

let result2 = travel5()
result2("London")

let result3: Void = travel5()("London")



// Capturando valores

func travel6() -> (String) -> Void {
    var counter = 1

    return {
        print("\(counter). I'm going to \($0)")
        counter += 1
    }
}

let result4 = travel6()
result4("London")

result4("London")
result4("London")
result4("London")

