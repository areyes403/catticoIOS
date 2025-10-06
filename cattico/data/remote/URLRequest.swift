//
//  UrlClient.swift
//  cattico
//
//  Created by Abraham Sahid Reyes Rodriguez on 06/10/25.
//

import Foundation
import UIKit

class URLRequest {
    private static let url = "https://api.thecatapi.com/v1"
    private var data:URLRequestData = URLRequestData()
    
    func addHeader(name:String, value:String){
        if data.headers == nil {
            data.headers = [:]
        }
        data.headers?[name] = value
    }
    
    func addParam(name:String, value:String){
        if data.queryItems == nil {
            data.queryItems = [:]
        }
        data.queryItems?[name] = value
    }
    
    func setBody(_ string: String) {
        data.body = string.data(using: .utf8)
    }

    func setBody(_ json: [String: Any]) {
        data.body = try? JSONSerialization.data(withJSONObject: json)
    }

    func setBody(_ rawData: Data) {
        data.body = rawData
    }

    func build() -> URLRequestData {
        return data
    }
    
}

class URLRequestData{
    var path:String?
    var method:String?
    var headers: [String: String]?
    var body: Data?
    var queryItems: [String: String]?
    init(){}
}
