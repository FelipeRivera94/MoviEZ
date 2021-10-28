//
//  NetworkError.swift
//  MoviEZ
//
//  Created by Felipe Rivera on 25/10/21.
//

import Foundation

// enum for error handling
enum NetworkError: Error {
    case invalid
    case notFound
    case apiError
    case internalError
    
    var errorDescription: String {
        switch self {
        case .invalid: return NSLocalizedString("invalid_error", comment:"")
        case .notFound: return NSLocalizedString("not_found_error", comment:"")
        case .apiError: return NSLocalizedString("api_error", comment: "")
        case .internalError: return NSLocalizedString("internal_error", comment:"")
        }
    }
}
