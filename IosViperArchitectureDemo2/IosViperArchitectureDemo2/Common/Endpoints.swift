import Foundation

struct API {
    static let baseUrl = "https://jsonplaceholder.typicode.com"
}

protocol Endpoint {
    var path: String { get }
    var url: String { get }
}

enum Endpoints {
    enum Posts: Endpoint {
        case fetch
        
        public var path: String {
            switch self {
            case .fetch: return "/photos"
            }
        }
        
        public var url: String {
            switch self {
            case .fetch: return "\(API.baseUrl)\(path)"
            }
        }
    }
}
