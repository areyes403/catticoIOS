//
//  Repository.swift
//  cattico
//
//  Created by Abraham Sahid Reyes Rodriguez on 06/10/25.
//

protocol Repository{
    func getCats() async throws -> [Cat]
}
