//
//  MovieApp
//
//  Created by Enes Kaya on 7.11.2023.
//

import Foundation

public protocol RequestParameters {
    func apply(urlRequest: URLRequest) -> URLRequest
}

public struct FormParameters: RequestParameters {
    public let data: [String: Any]

    public init(_ data: [String: Any]) {
        self.data = data
    }

    public func apply(urlRequest: URLRequest) -> URLRequest {
        var request = urlRequest
        request.setValue("application/x-www-form-urlencoded;charset=UTF-8", forHTTPHeaderField: "Content-Type")
        request.httpBody = data.keyValuePairs.data(using: .utf8)
        return request
    }
}

public struct JSONParameters: RequestParameters {
    public let json: Any

    public init(_ json: Any) {
        self.json = json
    }

    public func apply(urlRequest: URLRequest) -> URLRequest {
        var request = urlRequest
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        if let json = json as? [Any] {
            request.httpBody = json.jsonString.data(using: .utf8)
        } else if let json = json as? [String: Any] {
            request.httpBody = json.jsonString.data(using: .utf8)
        }

        return request
    }
}

public struct QueryParameters: RequestParameters {
    public let queryItems: [URLQueryItem]

    public init(_ queryItems: [URLQueryItem]) {
        self.queryItems = queryItems
    }

    public func apply(urlRequest: URLRequest) -> URLRequest {
        var request = urlRequest
        var urlComponents = URLComponents(url: request.url!, resolvingAgainstBaseURL: false)!
        var items = urlComponents.queryItems ?? []
        items.append(contentsOf: queryItems)
        urlComponents.queryItems = items
        request.url = urlComponents.url
        return request
    }
}
