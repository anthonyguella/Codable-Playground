//: [Previous](@previous)
/*:
 # Encode and Decode Manually
 If the structure of your Swift type differs from the structure of its encoded form, you must define your own encoding and decoding logic
 
 */
import Foundation

let jsonString = """
{
    "firstName":"John",
    "lastName":"Appleseed",
    "age":20
}
"""

struct Person {
    var name: Name
    var age: Int
    
    enum CodingKeys: String, CodingKey {
        case firstName
        case lastName
        case age
    }
}

struct Name: Codable {
    var firstName: String
    var lastName: String
}
/*:
 Encoding
 */
extension Person: Encodable {
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: Person.CodingKeys.self)
        try container.encode(name.firstName, forKey: .firstName)
        try container.encode(name.lastName, forKey: .lastName)
        try container.encode(age, forKey: .age)
    }
}

var person = Person(name: Name(firstName: "John", lastName: "Appleseed") , age: 20)
let encodedPerson = try? JSONEncoder().encode(person)
/*:
 Decoding
 */
extension Person: Decodable {
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: Person.CodingKeys.self)
        let firstName = try values.decode(String.self, forKey: .firstName)
        let lastName = try values.decode(String.self, forKey: .lastName)
        name = Name(firstName: firstName, lastName: lastName)
        age = try values.decode(Int.self, forKey: .age)
    }
}

if let jsonData = jsonString.data(using: .utf8) {
    let decodedPerson = try? JSONDecoder().decode(Person.self, from: jsonData)
}
//: [Next](@next)
