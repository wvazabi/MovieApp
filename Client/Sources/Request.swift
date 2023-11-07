//
//  MovieApp
//
//  Created by Enes Kaya on 7.11.2023.
//

import Foundation

public struct Request<Resource, Error: Swift.Error> {
    public var path: String
    public var method: HTTPMethod
    public var parameters: [RequestParameters]
    public var headers: [String: String]?
    public var resource: (Data) throws -> Resource  // Resource parser
    public var error: (Data) throws -> Error        // Error parser
    public var needsAuthorization: Bool

    public init(path: String,
                method: HTTPMethod,
                parameters: [RequestParameters] = [],
                headers: [String: String]? = nil,
                resource: @escaping (Data) throws -> Resource,
                error: @escaping (Data) throws -> Error,
                needsAuthorization: Bool) {
        self.path = path
        self.method = method
        self.parameters = parameters
        self.headers = headers
        self.resource = resource
        self.error = error
        self.needsAuthorization = needsAuthorization
    }
}

extension Request {
    @discardableResult
    public func response(using client: Client, completion: @escaping (Result<Resource, Client.Error>) -> Void) -> URLSessionTask {
        return client.perform(self, completion: completion)
    }
}
