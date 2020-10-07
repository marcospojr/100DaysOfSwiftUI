import UIKit

// Inicializadores

struct User {
    var username: String

    init() {
        username = "Anonymous"
        print("Creating a new user!")
    }
}

var user = User()

user.username = "twostraws"
print(user.username)



// Se referindo à instância atual

struct Person {
    var name: String

    init(name: String) {
        print("\(name) was born!")
        self.name = name
    }
}



// Propriedades preguiçosas
// (lazy properties)

struct FamilyTree {
    init() {
        print("Creating family tree!")
    }
}

struct Person2 {
    var name: String
    var familyTree = FamilyTree()

    init(name: String) {
        self.name = name
    }
}

var ed = Person2(name: "Ed")
ed.familyTree



// Propriedades e métodos estáticos

struct Student {
    static var classSize = 0
    var name: String

    init(name: String) {
        self.name = name
        Student.classSize += 1
    }
}

let ed2 = Student(name: "Ed")
let taylor = Student(name: "Taylor")

print(Student.classSize)



// Controle de acesso

struct Person3 {
    private var id: String
    
    init(id: String) {
        self.id = id
    }
    
    func identify() -> String {
        return "My security number is \(id)"
    }
}

let ed3 = Person3(id: "12345")
print(ed3.identify())
