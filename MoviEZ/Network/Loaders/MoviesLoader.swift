//
//  MoviesLoader.swift
//  MoviEZ
//
//  Created by Felipe Rivera on 26/10/21.
//

import Foundation

class  MoviesLoader: MovieWS, HTTPEngine {
    
    //urlSession for HTTPEngine protocol
    var urlSession: URLSession = URLSession.shared
    //MARK: init
    // singleton
    private init() {}
    static let shared = MoviesLoader()
    
    //MARK: fetchMovies
    /// fetch movies from category
    /// - parameter endpoint: movie category
    /// - parameter completion: fetching clousure
    func fetchMovies(from endpoint: MoviesCategory, completion: @escaping (Result<MovieResponse, NetworkError>) -> Void) {
        guard let url = URL(string: "\(API.baseUrl)/movie/\(endpoint.rawValue)") else {
            completion(.failure(.invalid))
            return
        }
        fetch(urlSession: urlSession, url: url, completion: completion)
    }
    
    //MARK: fetchMovie
    /// fetch a movie from id
    /// - parameter id: id of the movie
    /// - parameter completion: fetching clousure
    func fetchMovie(with id: Int, completion: @escaping (Result<Movie, NetworkError>) -> Void) {

        guard let url = URL(string: "\(API.baseUrl)/movie/\(id)") else {
            completion(.failure(.invalid))
            return
        }
        fetch(urlSession: urlSession, url: url, completion: completion)
    }
    
    //MARK: searchMovie
    ///  search for a movie
    /// - parameter query: query to search for a movie
    /// - parameter completion: fetching clousure
    func searchMovie(query: String, completion: @escaping (Result<MovieResponse, NetworkError>) -> Void) {
        let queryParams = [
            "language": "en-US",
            "include_adult": "false",
            "region": "US",
            "query": query
        ]
        guard let url = URL(string: "\(API.baseUrl)/search/movie") else {
            completion(.failure(.invalid))
            return
        }
        fetch(urlSession: urlSession, url: url,queryParams: queryParams, completion: completion)
    }
}
