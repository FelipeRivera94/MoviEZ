//
//  MovieExtension.swift
//  MoviEZ
//
//  Created by Felipe Rivera on 26/10/21.
//

import Foundation

//THIS EXTENSION ARE ONLY FOR PREVIEW TESTING
extension Movie {
    static var testMovies: [Movie] {
        let response: MovieResponse? = try? Bundle.main.load(filename: "movie_list")
        return response!.results
    }
    static var testMovie: Movie {
        testMovies[0]
    }
}

extension Cast {
    static var testCasts: [Cast] {
        let response: CreditsResponse? = try? Bundle.main.load(filename: "movie_info")
        return response!.cast
    }
    static var testCast: Cast {
        testCasts[0]
    }
}

extension Bundle {
    func load<D:Decodable>(filename: String) throws -> D? {
        guard let url = self.url(forResource: filename, withExtension: "json") else {
            return nil }
        let data = try Data(contentsOf: url)
        let decodedModel = try JSONDecoder().decode(D.self, from: data)
        return decodedModel
    }
}

