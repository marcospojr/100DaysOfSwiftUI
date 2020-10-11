import UIKit

var name = "Tim McGraw"
name = "Romeo"

let name2 = "Tim McGraw"
//name2 = "Romeo"



// Tipos de dados

var age: Int
age = 25

var latitude: Double
latitude = 36.166667

var longitude: Float
longitude = -86.783333
longitude = -186.783333
longitude = -1286.783333
longitude = -12386.783333
longitude = -123486.783333
longitude = -1234586.783333

var longitude2: Double
longitude2 = -1234586.783333



// Operadores

var a = 10
a = a + 1
a = a - 1
a = a * a

var b = 10
b += 10
b -= 10

var a2 = 1.1
var b2 = 2.2
var c = a2 + b2

c > 3
c >= 3
c > 4
c < 4


var both = name + " and " + name2

name == "Tim McGraw"
name != "Tim McGraw"

var stayOutTooLate = true
stayOutTooLate
!stayOutTooLate



// String Interpolation

"Your name is \(name)"
"Your name is " + name

"Your name is \(name), your age is \(age), and your latitude is \(latitude)"



// Arrays

var evenNumbers = [2, 4, 6, 8]
var songs = ["Shake it Off", "You Belong with Me", "Back to December"]

songs[0]
songs[1]
songs[2]

type(of: songs)

//var songs2 = ["Shake it Off", "You Belong with Me", "Back to December", 3]
//type(of: songs2)



// Dictionaries

var person = ["first": "Taylor", "middle": "Alison", "last": "Swift", "month": "December", "website": "taylorswift.com"]
person["middle"]
person["month"]

var person2 = [
                "first": "Taylor",
                "middle": "Alison",
                "last": "Swift",
                "month": "December",
                "website": "taylorswift.com"
            ]

person2["middle"]
person2["month"]



// Condicionais

var action: String
var person3 = "hater"

if person3 == "hater" {
    action = "hate"
} else if person3 == "player" {
    action = "play"
} else {
    action = "cruise"
}

var nothingInBrain = true

if stayOutTooLate && nothingInBrain {
    action = "cruise"
}



// Loops

var str = "Fakers gonna"

for _ in 1 ... 5 {
    str += " fake"
}

print(str)

var people = ["players", "haters", "heart-breakers", "fakers"]
var actions = ["play", "hate", "break", "fake"]

for i in 0 ... 3 {
    print("\(people[i]) gonna \(actions[i])")
}

for i in 0 ..< people.count {
    print("\(people[i]) gonna \(actions[i])")
}

for i in 0 ..< people.count {
    var str = "\(people[i]) gonna"

    for _ in 1 ... 5 {
        str += " \(actions[i])"
    }

    print(str)
}



// Switch case

let liveAlbums = 2

switch liveAlbums {
case 0:
    print("You're just starting out")

case 1:
    print("You just released iTunes Live From SoHo")

case 2:
    print("You just released Speak Now World Tour")

default:
    print("Have you done something new?")
}

let studioAlbums = 5

switch studioAlbums {
case 0...1:
    print("You're just starting out")

case 2...3:
    print("You're a rising star")

case 4...5:
    print("You're world famous!")

default:
    print("Have you done something new?")
}
