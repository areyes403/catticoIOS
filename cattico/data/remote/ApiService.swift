//
//  ApiService.swift
//  cattico
//
//  Created by Abraham Sahid Reyes Rodriguez on 06/10/25.
//
protocol ApiService {
    func fetchDataCats() async throws -> [CatData]
}

