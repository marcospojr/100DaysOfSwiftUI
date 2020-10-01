import UIKit

// Operadores Aritméticos

let firstScore = 12
let secondScore = 4

let total = firstScore + secondScore
let difference = firstScore - secondScore

let product = firstScore * secondScore
let divided = firstScore / secondScore

let remainder = 13 % secondScore



// Operadores de overloading (sobrecarga)

let meaningOfLife = 42
let doubleMeaning = 42 + 42

let fakers = "Fakers gonna "
let action = fakers + "fake"

let firstHalf = ["John", "Paul"]
let secondHalf = ["George", "Ringo"]
let beatles = firstHalf + secondHalf



// Operadores de atribuição compostos

var score = 95
score -= 5

var quote = "The rain in Spain falls mainly on the "
quote += "Spaniards"



// Operadores de comparação

let firstScoreComparison = 6
let secondScoreComparison = 4

firstScoreComparison == secondScoreComparison
firstScoreComparison != secondScoreComparison

firstScoreComparison < secondScoreComparison
firstScoreComparison >= secondScoreComparison

"Taylor" <= "Swift"



// Condições

let firstCard = 11
let secondCard = 10

if firstCard + secondCard == 2 {
    print("Aces – lucky!")
} else if firstCard + secondCard == 21 {
    print("Blackjack!")
} else {
    print("Regular cards")
}

if score > 9000 {
    print("It's over 9000!")
} else {
    if score == 9000 {
        print("It's exactly 9000!")
    } else {
        print("It's not over 9000!")
    }
}



// Combinando operadores

let age1 = 12
let age2 = 21

if age1 > 18 && age2 > 18 {
    print("Both are over 18")
}

if age1 > 18 || age2 > 18 {
    print("At least one is over 18")
}



// Operador ternário

let firstCardTernary = 11
let secondCardTernary = 10
print(firstCardTernary == secondCardTernary ? "Cards are the same" : "Cards are different")

if firstCardTernary == secondCardTernary {
    print("Cards are the same")
} else {
    print("Cards are different")
}



// Switch

let weather = "sunny"

switch weather {
case "rain":
    print("Bring an umbrella")
case "snow":
    print("Wrap up warm")
case "sunny":
    print("Wear sunscreen")
    fallthrough
default:
    print("Enjoy your day!")
}



// Operadores de Range (série, coleção)

let scoreRange = 85

switch scoreRange {
case 0..<50:
    print("You failed badly.")
case 50..<85:
    print("You did OK.")
default:
    print("You did great!")
}
