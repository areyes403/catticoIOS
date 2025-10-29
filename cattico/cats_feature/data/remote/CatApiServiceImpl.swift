//
//  ApiServiceImpl.swift
//  cattico
//
//  Created by Abraham Sahid Reyes Rodriguez on 06/10/25.
//

import Foundation

final class CatApiServiceImpl: CatApiService {
        
    private init(){}
    
    static var instance: CatApiServiceImpl = CatApiServiceImpl()

    func fetchDataCats() async throws -> [CatData] {
        return try await handleNetworking{
            let request = URLRequestBuilder()
                .setMethod(method:"GET")
                .setPath(path:"search")
                .addParam(name: "limit", value: "10")
                .addParam(name: "has_breeds", value: "1")
                .build()
            
            let (data, response) = try await URLSession.shared.data(for: request)
            guard ((response as? HTTPURLResponse)?.statusCode) != nil else
            {
                throw NetworkingError.invalidStatusCode(statusCode: -1)
            }
            
            let decoder = JSONDecoder()
            let catsData = try decoder.decode([CatData].self, from: data)
            
            return catsData
        }
    }
    
    func fetchCat(id: String) async throws -> InCatData {
        return try await handleNetworking{
            let request = URLRequestBuilder()
                .setMethod(method:"GET")
                .setPath(path:id)
                .build()
            
            let (data, response) = try await URLSession.shared.data(for: request)
            guard ((response as? HTTPURLResponse)?.statusCode) != nil else
            {
                throw NetworkingError.invalidStatusCode(statusCode: -1)
            }
            
            let decoder = JSONDecoder()
            let catData = try decoder.decode(InCatData.self, from: data)
            
            return catData
        }
    }
    
}

enum NetworkingError: Error {
    case encodingFailed(innerError: EncodingError)
    case decodingFailed(innerError: DecodingError)
    case invalidStatusCode(statusCode: Int)
    case requestFailed(innerError: URLError)
    case otherError(innerError: Error)
}

