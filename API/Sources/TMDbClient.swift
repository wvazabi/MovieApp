//  MovieApp
//
//  Created by Enes Kaya on 7.11.2023.
//

import Foundation
import Client
import Entities

public final class TMDbClient: LoggingClient {
    private let authorizationParameters: RequestParameters

    public init(apiKey: String) {
        self.authorizationParameters = QueryParameters([.init(name: "apikey", value: apiKey)])
        super.init(baseURL: EndPoints.baseUrl)
        defaultHeaders["Content-Type"] = "application/json"
    }

    public override func prepare<T, E>(request: Request<T, E>) -> Request<T, E> {
        var request = request
        if request.needsAuthorization {
            request.parameters.append(authorizationParameters)
        }
        return request
    }
}
