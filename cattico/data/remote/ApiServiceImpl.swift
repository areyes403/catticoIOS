//
//  ApiServiceImpl.swift
//  cattico
//
//  Created by Abraham Sahid Reyes Rodriguez on 06/10/25.
//

import Foundation

class ApiServiceImpl: ApiService {
    
    private init(){}
    
    static var instance: ApiServiceImpl = ApiServiceImpl()
    
    private static let baseUrl: String = "https://api.thecatapi.com/v1"


    func fetchDataCats() async throws -> [CatData] {
        do{
            var url = URL(string:ApiServiceImpl.baseUrl+"/images/search")!
    
            url.append(queryItems:[
                        URLQueryItem(name: "limit", value: "10")
            ])
            
            var request = URLRequest(url: url)
            request.httpMethod = "GET"
            
            let (data, response) = try await URLSession.shared.data(for: request)
            guard ((response as? HTTPURLResponse)?.statusCode) != nil else
            {
                throw NetworkingError.invalidStatusCode(statusCode: -1)
            }
            
            let decoder = JSONDecoder()
            let catsData = try decoder.decode([CatData].self, from: data)
            
            return catsData
            
        } catch let error as DecodingError {
            throw NetworkingError.decodingFailed(innerError: error)
        } catch let error as EncodingError {
            throw NetworkingError.encodingFailed(innerError: error)
        } catch let error as URLError {
            throw NetworkingError.requestFailed(innerError: error)
        } catch let error as NetworkingError {
            throw error
        } catch {
            throw NetworkingError.otherError(innerError: error)
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

