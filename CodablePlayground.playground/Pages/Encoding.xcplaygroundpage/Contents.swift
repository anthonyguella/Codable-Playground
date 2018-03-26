//: [Previous](@previous)
/*:
 # Encoding
 */
import Foundation

struct Person: Codable {
    var name: String
    var age: Int
    var car: Car
}

struct Car: Codable {
    var brand: String
    var name: String
    var year: Int
}

let person = Person(name: "John", age: 20, car: Car(brand: "Porsche", name: "911", year: 2018))

let encodedPerson = try? JSONEncoder().encode(person)

let jsonString = String(bytes: encodedPerson!, encoding: .utf8)
//: [Next](@next)
