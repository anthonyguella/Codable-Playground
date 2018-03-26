//: [Previous](@previous)
/*:
 # Coding Keys
 Allows you to omit certain properties and also provide alternate keys
 
 */
import Foundation

struct Person: Codable {
    var name: String
    var age: Int
    var gender: String? = nil
    
    enum CodingKeys: String, CodingKey {
        case name = "first_name"
        case age
    }
}
//: [Next](@next)
