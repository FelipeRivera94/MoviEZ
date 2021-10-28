//
//  MovieWS.swift
//  MoviEZ
//
//  Created by Felipe Rivera on 25/10/21.
//

import Foundation

// protocol for all movie services
protocol MovieWS {
    func fetchMovies(from endpoint: MoviesCategory, completion: @escaping (Result<MovieResponse, NetworkError>) -> Void)
    func fetchMovie(with id: Int, completion: @escaping (Result<Movie,NetworkError>) -> Void)
    func searchMovie(query: String, completion: @escaping (Result<MovieResponse, NetworkError>) -> Void)
}
// enum for movie categories endPoints
enum MoviesCategory: String, CaseIterable {
    case popular = "popular"
    case upcoming = "upcoming"
    case topRated = "top_rated"
    
    func localizedString() -> String {
        return NSLocalizedString("movies_\(self.rawValue)", comment: "")
    }
    
    static func getTitleFor(title:MoviesCategory) -> String {
        return title.localizedString()
    }
}
