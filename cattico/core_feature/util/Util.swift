//
//  Util.swift
//  cattico
//
//  Created by Abraham Sahid Reyes Rodriguez on 28/10/25.
//

import Foundation

func handleNetworking<T>(_ operation: @escaping () async throws -> T) async throws -> T {
    do {
        return try await operation()
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

