import Foundation
import UIKit

struct Pokemon: Codable {
    let id: Int
    let name: String
    let height: Int
    let order: Int
    let types: [PokemonType]
    let sprite: String?
    let description: String?
    var image: UIImage?
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case height
        case order
        case types
        case sprite
        case description
    }
}

struct PokemonType: Codable {
    let name: String
    let id: Int
}
