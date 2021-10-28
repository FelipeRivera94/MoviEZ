//
//  MovieDetailsPublisher.swift
//  MoviEZ
//
//  Created by Felipe Rivera on 26/10/21.
//

import SwiftUI

class MovieDetailsPublisher: ObservableObject {
    //models services
    private let movieService: MovieWS
    private let creditsService: CreditsWS
    private let videoService: VideoWS
    //published objects 
    @Published var isLoading = false
    @Published var movie: Movie?
    @Published var credits: CreditsResponse?
    @Published var trailers: VideoResponse?
    @Published var error: NetworkError?
    //MARK: init
    init(movieService: MovieWS = MoviesLoader.shared, creditsService: CreditsWS = CreditsLoader.shared, videoService: VideoWS = VideosLoader.shared) {
        self.movieService = movieService
        self.creditsService = creditsService
        self.videoService = videoService
    }
    
    //MARK: loadMovie
    /// get a movie
    /// - parameter id: id of the movie that will be fetch
    func loadMovie(id: Int) {
        self.movie = nil
        self.isLoading = false
        self.movieService.fetchMovie(with: id) { [weak self] (result) in
            guard let self = self else {return}
            self.isLoading = false
            switch result {
            case .success(let movie):
                self.movie = movie
            case .failure(let error):
                self.error = error as NetworkError
            }
        }
    }
    //MARK: loadCredits
    /// get all trailers of a movie
    /// - parameter movieId: id of the movie in which the credits will be fetch
    func loadCredits(movieId: Int) {
        self.credits = nil
        self.isLoading = false
        self.creditsService.fetchCredits(from: movieId) { [weak self] (result) in
            guard let self = self else {return}
            self.isLoading = false
            switch result {
            case .success(let response):
                self.credits = response
            case .failure(let error):
                self.error = error as NetworkError
            }
        }
    }
    //MARK: loadTrailers
    /// get all trailers of a movie
    /// - parameter movieId: id of the movie in which the trailers will be fetch
    func loadTrailers(movieId: Int) {
        self.trailers = nil
        self.isLoading = false
        self.videoService.fetchVideos(from: movieId) { [weak self] (result) in
            guard let self = self else {return}
            self.isLoading = false
            switch result {
            case .success(let response):
                self.trailers = response
            case .failure(let error):
                self.error = error as NetworkError
            }
        }
    }
    //MARK: loadTrailers
    /// load all details of a movie
    /// - parameter movieId: id of the movie that will be loaded with all the details
    func loadDetails(movieId: Int) {
        loadMovie(id: movieId)
        loadCredits(movieId: movieId)
        loadTrailers(movieId: movieId)
    }
}



