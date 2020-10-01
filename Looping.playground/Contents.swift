import UIKit

// For loops

let count = 1...10

for number in count {
    print("Number is \(number)")
}

let albums = ["Red", "1989", "Reputation"]

for album in albums {
    print("\(album) is on Apple Music")
}

print("Players gonna ")

for _ in 1...5 {
    print("play")
}



// While loops

var number = 1

while number <= 20 {
    print(number)
    number += 1
}

print("Ready or not, here I come!")



// Repeat loops

repeat {
    print(number)
    number += 1
} while number <= 20

print("Ready or not, here I come!")

// Nunca será executado
//while false {
//    print("This is false")
//}

// Executa pelo menos uma vez
repeat {
    print("This is false")
} while false



// Saindo de loops

var countDown = 10

while countDown >= 0 {
    print(countDown)

    if countDown == 4 {
        print("I'm bored. Let's go now!")
        break
    }

    countDown -= 1
}

print("Blast off!")



// Saindo de múltiplos loops

outerLoop: for i in 1...10 {
    for j in 1...10 {
        let product = i * j
        print ("\(i) * \(j) is \(product)")

        if product == 50 {
            print("It's a bullseye!")
            break outerLoop
        }
    }
}

print("")

// Pulando loops

for i in 1...10 {
    if i % 2 == 1 {
        continue
    }

    print(i)
}



// Loops infinitos

var counter = 0

while true {
    print(" ")
    counter += 1

    if counter == 273 {
        break
    }
}
