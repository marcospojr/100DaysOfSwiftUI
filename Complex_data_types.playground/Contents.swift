import UIKit

// Arrays

let john = "John Lennon"
let paul = "Paul McCartney"
let george = "George Harrison"
let ringo = "Ringo Starr"

let beatles = [john, paul, george, ringo]

beatles[1]



// Sets

let colors = Set(["red", "blue", "green"])

let colors2 = Set(["red", "blue", "green", "red", "blue"])



// Tuplas

var name = (first: "Taylor", last: "Swift")

name.0
name.first

var website = (name: "Apple", url: "www.apple.com")

website.url

var person = (name: "Paul", age: 40, isMarried: true)

person.age



// Arrays x Sets x Tuplas

let address = (house: 555, street: "Taylor Swift Avenue", city: "Nashville")

let set = Set(["aardvark", "astronaut", "azalea"])

let pythons = ["Eric", "Graham", "John", "Michael", "Terry", "Terry"]



// Dictionaries

let heights = [
    "Taylor Swift": 1.78,
    "Ed Sheeran": 1.73
]

heights["Taylor Swift"]



// Valores padrão para Dictionary

let favoriteIceCream = [
    "Paul": "Chocolate",
    "Sophie": "Vanilla"
]

favoriteIceCream["Paul"]
favoriteIceCream["Charlotte", default: "Unknown"]

let results = [
    "english": 100,
    "french": 85,
    "geography": 75
]

let historyResult = results["history", default: 0]



// Criando coleções vazias

var teams = [String: String]()
teams["Paul"] = "Red"

var results2 = [Int]()

var words = Set<String>()
var numbers = Set<Int>()

var scores = Dictionary<String, Int>()
var results3 = Array<Int>()



// Enumerações

let result = "failure"
let result2 = "failed"
let result3 = "fail"

enum Result {
    case sucess
    case failure
}

let result4 = Result.failure



// Valores associados das Enums

enum Activity {
    case bored
    case running(destination: String)
    case talking(topic: String)
    case singing(volume: Int)
}

let talking = Activity.talking(topic: "football")

enum Weather {
    case sunny
    case windy(speed: Int)
    case rainy(chance: Int, amount: Int)
}



// Raw values dos Enums

enum Planet: Int {
    case mercury = 1
    case venus
    case earth
    case mars
}

let earth = Planet(rawValue: 3)

enum Mood: Int {
    case happy
    case sad
    case grumpy
    case sleepy
    case hungry
}

Mood.happy


