//: [Previous](@previous)

/*:
 # The Swift 3 Way
 */
import Foundation

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

let jsonData = jsonString.data(using: .utf8)

struct Person: Codable {
    var name: String
    var age: Int
    var car: Car
    
    init?(data: Data) throws {
        guard let json = try JSONSerialization.jsonObject(with: data) as? [String: Any] else {
            return nil
        }
        
        guard let name = json["name"] as? String, let age = json["age"] as? Int else {
            return nil
        }
        
        guard let carDict = json["car"] as? [String: Any] else {
            return nil
        }
        
        guard let carBrand = carDict["brand"] as? String, let carName = carDict["name"] as? String, let carYear = carDict["year"] as? Int else {
            return nil
        }
        
        self.name = name
        self.age = age
        self.car = Car(brand: carBrand, name: carName, year: carYear)
    }
}

struct Car: Codable {
    var brand: String
    var name: String
    var year: Int
}
//: [Next](@next)
