//
//  MovieApp
//
//  Created by Enes Kaya on 7.11.2023.
//

import Foundation

extension String {
    func appendingPathComponent(_ pathComponent: String) -> String {
        return NSString(string: self).appendingPathComponent(pathComponent)
    }
}

extension Dictionary {
    var jsonString: String {
        if let json = try? JSONSerialization.data(withJSONObject: self, options: []), let stringValue = String(data: json, encoding: .utf8) {
            return stringValue
        } else {
            return ""
        }
    }
}

extension Array {
    var jsonString: String {
        if let json = try? JSONSerialization.data(withJSONObject: self, options: []), let stringValue = String(data: json, encoding: .utf8) {
            return stringValue
        } else {
            return ""
        }
    }
}

extension Dictionary {
    var keyValuePairs: String {
        return map { kv in
            let key = kv.key
            let value = "\(kv.value)".addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)!
            return "\(key)=\(value)"
        }.joined(separator: "&")
    }
}

extension Dictionary {
    public mutating func merge(contentsOf dictionary: [Key: Value]) {
        dictionary.forEach { key, value in
            self[key] = value
        }
    }

    public func merging(contentsOf dictionary: [Key: Value]) -> [Key: Value] {
        var me = self
        me.merge(contentsOf: dictionary)
        return me
    }
}

public protocol OptionalProtocol {
    associatedtype Wrapped
    var _unbox: Wrapped? { get }
    init(nilLiteral: ())
    init(_ some: Wrapped)
}

extension Optional: OptionalProtocol {
    public var _unbox: Wrapped? {
        return self
    }
}

extension Dictionary where Value: OptionalProtocol {
    public var nonNils: [Key: Value.Wrapped] {
        var result: [Key: Value.Wrapped] = [:]

        forEach { pair in
            if let value = pair.value._unbox {
                result[pair.key] = value
            }
        }

        return result
    }
}

extension Decodable {
    public static func dataDecodeable<T>() -> ((Data) throws -> T) where T: Decodable {
        return { (data: Data) in
            let decoder: JSONDecoder = .init()
            decoder.dateDecodingStrategy = .iso8601
            return try decoder.decode(T.self, from: data)
        }
    }
}
