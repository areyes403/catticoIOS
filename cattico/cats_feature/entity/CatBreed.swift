//
//  CatBread.swift
//  cattico
//
//  Created by Abraham Sahid Reyes Rodriguez on 28/10/25.
//

struct CatBreed: Codable {
    let id: String
    let name: String
    let origin: String
    let description: String
    let lifeSpan: String
    let temperament: String
    let indoor: Int
    let lap: Int?
    let adaptability: Int
    let affectionLevel: Int
    let childFriendly: Int
    let dogFriendly: Int
    let energyLevel: Int
    let grooming: Int
    let healthIssues: Int
    let intelligence: Int
    let sheddingLevel: Int
    let socialNeeds: Int
    let strangerFriendly: Int
    let vocalisation: Int
    let hypoallergenic: Int
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case origin
        case description
        case lifeSpan = "life_span"
        case temperament
        case indoor
        case lap
        case adaptability
        case affectionLevel = "affection_level"
        case childFriendly = "child_friendly"
        case dogFriendly = "dog_friendly"
        case energyLevel = "energy_level"
        case grooming
        case healthIssues = "health_issues"
        case intelligence
        case sheddingLevel = "shedding_level"
        case socialNeeds = "social_needs"
        case strangerFriendly = "stranger_friendly"
        case vocalisation
        case hypoallergenic
    }

}
