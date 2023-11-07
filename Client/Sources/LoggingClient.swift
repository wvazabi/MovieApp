//
//  LoggingClient.swift
//  MovieApp
//
//  Created by Enes Kaya on 7.11.2023.
//

import Foundation

open class LoggingClient: Client {
    override open func perform<Resource, Error>(
        _ request: Request<Resource, Error>,
        completion: @escaping (Result<Resource, Client.Error>) -> Void) -> URLSessionTask {
        let description = "\(request.method.rawValue) \(request.path): \(request.parameters))"
        print("Sent request: " + description)
        return super.perform(request, completion: { result in
            switch result {
            case .success:
                print("Received response for: " + description)
            case .failure(let error):
                print("Request failed: " + description + "\nWith error: " + error.localizedDescription)
            }
            completion(result)
        })
    }
}
