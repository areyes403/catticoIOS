//
//  AuthInteractor.swift
//  cattico
//
//  Created by Abraham Sahid Reyes Rodriguez on 09/10/25.
//

protocol AuthInteractorProtocol:AnyObject{
    func singIn(credentials:CredentialsDto) async throws
    func signUp(user:UserDto) async throws
}

class AuthInteractor: AuthInteractorProtocol {
    
    private var apiService:AuthApiServiceProtocol

    init(apiService: AuthApiServiceProtocol = AuthApiService.instance) {
        self.apiService = apiService
    }
    
    func singIn(credentials: CredentialsDto) async throws {
        let response = try await apiService.login(credentials: credentials)
        print(response)
    }
    
    func signUp(user:UserDto) async throws {
        let response = try await apiService.register(userData: user)
        print(response)
    }

}
