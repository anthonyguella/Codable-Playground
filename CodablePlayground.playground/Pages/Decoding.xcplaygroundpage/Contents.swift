//: [Previous](@previous)
/*:
 # Decoding
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

let jsonString = """
{
    "name":"John",
    "age":20,
    "car":{
        "brand":"Porsche",
        "name":"911",
        "year":2018
    }
}
"""

if let jsonData = jsonString.data(using: .utf8) {
    _ = try? JSONDecoder().decode(Person.self, from: jsonData)
}
//: [Next](@next)
