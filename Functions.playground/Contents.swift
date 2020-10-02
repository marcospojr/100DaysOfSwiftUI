import UIKit


// Escrevendo funções

func printHelp() {
    let message = """
Welcome to MyApp!

Run this app inside a directory of images and
MyApp will resize them all into thumbnails
"""

    print(message)
}

printHelp()



// Aceitando parâmetros

print("Hello, world!")

func square(number: Int) {
    print(number * number)
}

square(number: 8)



// Retornando valores

func square2(number: Int) -> Int {
    return number * number
}

let result = square2(number: 8)
print(result)



// Rótulos de parâmetros

func sayHello(to name: String) {
    print("Hello, \(name)!")
}

sayHello(to: "Taylor")



// Omitindo rótulos dos parâmetros

func greet(_ person: String) {
    print("Hello, \(person)!")
}

greet("Taylor")



// Parâmetros padrão

func greet(_ person: String, nicely: Bool = true) {
    if nicely == true {
        print("Hello, \(person)!")
    } else {
        print("Oh no, it's \(person) again...")
    }
}

greet("Taylor")
greet("Taylor", nicely: false)



// Funções variadas

print("Haters", "gonna", "hate")

func square(numbers: Int...) {
    for number in numbers {
        print("\(number) squared is \(number * number)")
    }
}

square(numbers: 1, 2, 3, 4, 5)



// Escrevendo e executando Throw functions

enum PasswordError: Error {
    case obvious
}

func checkPassword(_ password: String) throws -> Bool {
    if password == "password" {
        throw PasswordError.obvious
    }

    return true
}

do {
    try checkPassword("password")
    print("That password is good!")
} catch {
    print("You can't use that password.")
}



// Parâmetros de entrada e saída

func doubleInPlace(number: inout Int) {
    number *= 2
}

var myNum = 10
doubleInPlace(number: &myNum)
