//
//  InCatData.swift
//  cattico
//
//  Created by Abraham Sahid Reyes Rodriguez on 28/10/25.
//


struct InCatData: Codable {
    let id: String
    let url: String
    let width: Int
    let height: Int
    let breeds: [CatBreed]?
}
