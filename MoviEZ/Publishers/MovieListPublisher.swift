//
//  MovieListPublisher.swift
//  MoviEZ
//
//  Created by Felipe Rivera on 26/10/21.
//

import Foundation

class MovieListPublisher: ObservableObject {
    // published objects
    @Published var movies: [Movie]?
    @Published var error: NetworkError?
    @Published var isLoading = false
    // movie service
    private let movieService: MovieWS
    //MARK: init
    init(movieService: MovieWS = MoviesLoader.shared){
        self.movieService = movieService
    }
    //MARK: loadMovies
    /// load all movies of a category
    /// - parameter endpoint: endpoint will especify the category of the movies that will be fetch
    func loadMovies(with endpoint: MoviesCategory) {
        self.movies = nil
        self.isLoading = false
        self.movieService.fetchMovies(from: endpoint) {[weak self] (result) in
            guard let self = self else {return}
            self.isLoading = false
            
            switch result {
            case .success(let response):
                self.movies = response.results
            case .failure(let error):
                self.error = error as NetworkError
            }
        }
    }
}
