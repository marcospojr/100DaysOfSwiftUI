import UIKit

// Properties

//struct Person {
//    var clothes: String
//    var shoes: String
//
//    func describe() {
//        print("I like wearing \(clothes) with \(shoes)")
//    }
//}
//
//let taylor = Person(clothes: "T-shirts", shoes: "sneakers")
//let other = Person(clothes: "short skirts", shoes: "high heels")
//taylor.describe()
//other.describe()
//print("\n")
//
//struct Person2 {
//    var clothes: String {
//        willSet {
//            updateUI(msg: "I'm changing from \(clothes) to \(newValue)")
//        }
//
//        didSet {
//            updateUI(msg: "I just changed from \(oldValue) to \(clothes)")
//        }
//    }
//}
//
//func updateUI(msg: String) {
//    print(msg)
//}
//
//var taylor2 = Person2(clothes: "T-shirts")
//taylor2.clothes = "short skirts"
//print("\n")
//
//struct Person3 {
//    var age: Int
//
//    var ageInDogYears: Int {
//        get {
//            return age * 7
//        }
//    }
//}
//
//var fan = Person3(age: 25)
//print(fan.ageInDogYears)



// Propiedade estáticas e métodos

struct TaylorFan {
    static var favoriteSong = "Look What You Made Me Do"
    
    var name: String
    var age: Int
}

let fan2 = TaylorFan(name: "James", age: 25)
//print(TaylorFan.favoriteSong)



// Controle de acesso

class TaylorFan2 {
    fileprivate var name: String?
}

class TaylorFan3 {
    private var name: String?
}



// Polimorfismo e Typecasting

class Album {
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    func getPerformance() -> String {
        return "The album \(name) sold lots"
    }
}
class StudioAlbum: Album {
    var studio: String
    
    init(name: String, studio: String) {
        self.studio = studio
        super.init(name: name)
    }
    
    override func getPerformance() -> String {
        return "The studio album \(name) sold lots."
    }
}

class LiveAlbum: Album {
    var location: String
    
    init(name: String, location: String) {
        self.location = location
        super.init(name: name)
    }
    
    override func getPerformance() -> String {
        return "The live album \(name) sold lots"
    }
}

var taylorSwift = StudioAlbum(name: "Taylor Swift", studio: "The Castles Studio")
var fearless = StudioAlbum(name: "Fearless", studio: "Aimeeland Studio")
var iTunesLive = LiveAlbum(name: "iTunes Live from SoHo", location: "New York")
var AllAlbums: [Album] = [taylorSwift, fearless, iTunesLive]

for album in AllAlbums {
    print(album.getPerformance())

    // Quando tiver certeza
//    let studioAlbum = album as! StudioAlbum
//    print(studioAlbum.studio)

    if let studioAlbum = album as? StudioAlbum {
        print(studioAlbum.studio)
    } else if let liveAlbum = album as? LiveAlbum {
        print(liveAlbum.location)
    }
}

// Cria um array vazio caso não converta
for album in AllAlbums as? [LiveAlbum] ?? [LiveAlbum]() {
    print(album.getPerformance())
    print(album.location)
}

let number = 5
let text = String(number)
print(text)



// Closures

let vw = UIView()

UIView.animate(withDuration: 0.5, animations: {
    vw.alpha = 0
})

UIView.animate(withDuration: 0.5) {
    vw.alpha = 0
}


