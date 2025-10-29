//
//  ApiService.swift
//  cattico
//
//  Created by Abraham Sahid Reyes Rodriguez on 06/10/25.
//
protocol CatApiService {
    func fetchDataCats() async throws -> [CatData]
    func fetchCat(id: String) async throws -> InCatData
}

