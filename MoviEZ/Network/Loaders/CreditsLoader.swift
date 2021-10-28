//
//  CreditsLoader.swift
//  MoviEZ
//
//  Created by Felipe Rivera on 26/10/21.
//

import Foundation

class CreditsLoader: CreditsWS, HTTPEngine {
    //urlSession for HTTPEngine protocol
    var urlSession: URLSession = URLSession.shared
    //MARK: init
    // singleton
    private init() {}
    static let shared = CreditsLoader()
    //MARK: fetchCredits
    /// fetch credits for a movie
    /// - parameter movieId: id of the movie in which the credits will be fetch
    /// - parameter completion: fetching clousure
    func fetchCredits(from movieId: Int, completion: @escaping (Result<CreditsResponse, NetworkError>) -> Void) {
        guard let url = URL(string: "\(API.baseUrl)/movie/\(movieId)/credits") else {
            completion(.failure(.internalError))
            return
        }
        fetch(urlSession: urlSession, url: url, completion: completion)
    }
}
