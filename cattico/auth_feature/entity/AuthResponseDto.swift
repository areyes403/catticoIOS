//
//  AuthResponseDto.swift
//  cattico
//
//  Created by Abraham Sahid Reyes Rodriguez on 09/10/25.
//

struct AutAuthResponseDto: Decodable {
    let token: String
    enum CodingKeys: String, CodingKey {
        case token = "access_token"
    }
}

