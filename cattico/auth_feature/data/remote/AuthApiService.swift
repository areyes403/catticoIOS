//
//  AuthApiService.swift
//  cattico
//
//  Created by Abraham Sahid Reyes Rodriguez on 09/10/25.
//

protocol AuthApiServiceProtocol {
    func login(credentials:CredentialsDto) async throws -> AutAuthResponseDto
    func register(userData:UserDto) async throws -> AutAuthResponseDto
}

final class AuthApiService:AuthApiServiceProtocol {

    //private var firebaseAuth:FirebaseAuth!
    
    static let instance = AuthApiService()
    
    func login(credentials: CredentialsDto) async throws -> AutAuthResponseDto {
        //try await Task.sleep(nanoseconds: 3_000_000_000)
        return AutAuthResponseDto(token: "token")
    }
    
    func register(userData: UserDto) async throws -> AutAuthResponseDto {
        //try await Task.sleep(nanoseconds: 3_000_000_000)
        return AutAuthResponseDto(token: "token")
    }
    
    
}
