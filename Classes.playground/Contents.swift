import UIKit

// Criando suas próprias classes

//class Dog {
//    var name: String
//    var breed: String
//
//    init(name: String, breed: String) {
//        self.name = name
//        self.breed = breed
//    }
//}
//
//let poppy = Dog(name: "Poppy", breed: "Poodle")
//


// Herança de classe

//class Poodle: Dog {
//    init(name: String) {
//        super.init(name: name, breed: "Poodle")
//    }
//}



// Sobrepondo métodos

//class Dog {
//    func makeNoise() {
//        print("Woof!")
//    }
//}
//
//class Poodle: Dog {
//    override func makeNoise() {
//        print("Yip!")
//    }
//}
//
//let poppy = Poodle()
//poppy.makeNoise()



// Classes finais (final classes)

final class Dog {
    var name: String
    var breed: String

    init(name: String, breed: String) {
        self.name = name
        self.breed = breed
    }
}



// Copiando objetos

//class Singer {
//    var name = "Taylor Swift"
//}
//
//var singer = Singer()
//print(singer.name)
//
//var singerCopy = singer
//singerCopy.name = "Justin Bieber"
//
//print(singer.name)



// Desinicializadores

//class Person {
//    var name = "John Doe"
//
//    init() {
//        print("\(name) is alive!")
//    }
//
//    func printGreeting() {
//        print("Hello, I'm \(name)")
//    }
//
//    deinit {
//        print("\(name) is no more!")
//    }
//}
//
//for _ in 1...3 {
//    let person = Person()
//    person.printGreeting()
//}



// Mutabilidade

class Singer {
    var name = "Taylor Swift"
}

let taylor = Singer()
taylor.name = "Ed Sheeran"
print(taylor.name)

// Se não quiser permitir, basta tornar a variável
// name uma constante:

class Singer2 {
    let name = "Taylor Swift"
}
