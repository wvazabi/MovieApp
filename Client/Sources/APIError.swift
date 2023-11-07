//
//  MovieApp
//
//  Created by Enes Kaya on 7.11.2023.
//

import Foundation

public struct APIError: Swift.Error {
    let errorData: Data
    
    public init(_ data: Data) {
        errorData = data
    }
}
