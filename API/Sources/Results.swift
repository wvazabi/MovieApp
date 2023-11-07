//
//  MovieApp
//
//  Created by Enes Kaya on 7.11.2023.
//

import Foundation

public struct Results<T: Codable>: Codable {
    public let Search: T
    public let Error: String?
    public let Response: String?
}
