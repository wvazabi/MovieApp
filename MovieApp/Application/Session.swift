//
//  Session.swift
//  MovieApp
//
//  Created by Enes Kaya on 7.11.2023.
//

import Foundation
import API

final class Session {
    let client: TMDbClient

    init() {
        client = TMDbClient(apiKey: StringConstants.apikey)
    }
}
