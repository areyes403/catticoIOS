//
//  UrlClient.swift
//  cattico
//
//  Created by Abraham Sahid Reyes Rodriguez on 06/10/25.
//

import Foundation
import UIKit

class URLRequestBuilder {
    private let url = "https://api.thecatapi.com/v1/images/"
    private var data:URLRequestData = URLRequestData()
    
    func setPath(path:String) -> URLRequestBuilder {
        data.path = path
        return self
    }
    func setMethod(method: String) -> URLRequestBuilder {
        data.method = method
        return self
    }
    
    func addHeader(name:String, value:String) -> URLRequestBuilder {
        if data.headers == nil {
            data.headers = [:]
        }
        data.headers?[name] = value
        return self
    }
    
    func addParam(name:String, value:String) -> URLRequestBuilder {
        if data.queryItems == nil {
            data.queryItems = [:]
        }
        data.queryItems?[name] = value
        return self
    }
    
    func setBody(_ string: String) -> URLRequestBuilder {
        data.body = string.data(using: .utf8)
        return self
    }

    func setBody(_ json: [String: Any]) -> URLRequestBuilder {
        data.body = try? JSONSerialization.data(withJSONObject: json)
        return self
    }

    func setBody(_ rawData: Data) -> URLRequestBuilder {
        data.body = rawData
        return self
    }

    func build() -> URLRequest {
        let path = data.path ?? ""
        var url = URL(string:url + path)!
        var queryItems = [URLQueryItem]()
        
        data.queryItems?.forEach { key, value in
            queryItems.append(URLQueryItem(name: key, value: value))
        }
        
        url.append(queryItems: queryItems)
        
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.httpMethod = data.method ?? "GET"
        request.httpBody = data.body
        data.headers?.forEach { key, value in
            request.setValue(key, forHTTPHeaderField: value)
        }
        return request
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
