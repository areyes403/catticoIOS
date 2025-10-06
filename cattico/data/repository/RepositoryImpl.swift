//
//  RepositoryImpl.swift
//  cattico
//
//  Created by Abraham Sahid Reyes Rodriguez on 06/10/25.
//
class RepositoryImpl: Repository {
    
    private let api:ApiService
    
    private init(api: ApiService) {
        self.api = api
    }
    
    static let instance:Repository = RepositoryImpl(api: ApiServiceImpl.instance)
    
    func getCats() async throws -> [Cat] {
        return try await api.fetchDataCats().map{ dto in
            Cat(
                id: dto.id,
                url: dto.url,
                width: dto.width,
                height: dto.height
            )
        }
    }
    
    
}
