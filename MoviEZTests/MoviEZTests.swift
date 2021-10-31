//
//  MoviEZTests.swift
//  MoviEZTests
//
//  Created by Felipe Rivera on 25/10/21.
//

import XCTest
@testable import MoviEZ

class MoviEZTests: XCTestCase {

    let moviesList = MovieListPublisher()
    let movieDetails = MovieDetailsPublisher()
    
    
    func testGetMovies() {
        moviesList.loadMovies(with: .popular)
        guard moviesList.movies != nil else {
            XCTFail()
            return
        }
        XCTAssert(!moviesList.movies!.isEmpty, "Error in popular movies")
        moviesList.loadMovies(with: .upcoming)
        guard moviesList.movies != nil else {
            XCTFail()
            return
        }
        XCTAssert(!moviesList.movies!.isEmpty, "Error in upcoming movies")
        moviesList.loadMovies(with: .topRated)
        guard moviesList.movies != nil else {
            XCTFail()
            return
        }
        XCTAssert(!moviesList.movies!.isEmpty, "Error in top rated movies")
    }
    
    func testGetMovie(){
        movieDetails.loadMovie(id: 338762)
        guard movieDetails.movie != nil else {
            XCTFail()
            return
        }
        movieDetails.loadCredits(movieId: 338762)
        guard movieDetails.credits != nil else {
            XCTFail()
            return
        }
        movieDetails.loadTrailers(movieId: 338762)
        guard movieDetails.trailers != nil else {
            XCTFail()
            return
        }
    }
}
