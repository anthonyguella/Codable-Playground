//: [Previous](@previous)
/*:
# Codable Protocol
 Used for the serialization and deserialization of Data
 
 Just a typealias of Decodable and Encodable
 */
 public typealias Codable = Decodable & Encodable
/*:

The easiest way to make a struct codable is to include types that are already Codable.

### Built in codable types:
- Swift Standard Library Ex) String, Int, Double
- Foundation Types Ex) Date, Data, URL
- Array, Dictionary, and Optional conform to Codable if they contain Codable types
*/
struct Person {
    var name: String
    var age: Int
    var car: Car
}

struct Car {
    var brand: String
    var name: String
    var year: Int
}
/*:
 Conform to Codable in order to encode and decode
 */
struct CodablePerson: Codable {
    var name: String
    var age: Int
    var car: CodableCar
}

struct CodableCar: Codable {
    var brand: String
    var name: String
    var year: Int
}

/*:
 Can Encode and Decode only if needed
 */
struct EncodablePerson: Encodable {
    var name: String
    var age: Int
    var car: CodableCar
}

struct DecodablePerson: Decodable {
    var name: String
    var age: Int
    var car: CodableCar
}
//: [Next](@next)

