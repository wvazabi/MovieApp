//
//  MovieApp
//
//  Created by Enes Kaya on 7.11.2023.
//

public protocol ResultProtocol {
    associatedtype Value
    associatedtype Error: Swift.Error

    var value: Value? { get }
    var error: Error? { get }
}

/// An enum representing either a failure or a success.
public enum Result<T, E: Swift.Error>: CustomStringConvertible {
    case success(T)
    case failure(E)

    /// Constructs a result with a success value.
    public init(_ value: T) {
        self = .success(value)
    }

    /// Constructs a result with an error.
    public init(_ error: E) {
        self = .failure(error)
    }

    public var description: String {
        switch self {
        case let .success(value):
            return ".success(\(value))"
        case let .failure(error):
            return ".failure(\(error))"
        }
    }
}

extension Result: ResultProtocol {
    public var value: T? {
        if case .success(let value) = self {
            return value
        } else {
            return nil
        }
    }

    public var error: E? {
        if case .failure(let error) = self {
            return error
        } else {
            return nil
        }
    }

    public var unbox: Result<T, E> {
        return self
    }

    public func map<U>(_ transform: (T) -> U) -> Result<U, E> {
        switch self {
        case let .success(value):
            return .success(transform(value))
        case let .failure(error):
            return .failure(error)
        }
    }
}
