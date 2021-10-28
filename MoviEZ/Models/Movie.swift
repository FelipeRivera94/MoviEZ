//
//  MovieModel.swift
//  MoviEZ
//
//  Created by Felipe Rivera on 25/10/21.
//

import Foundation

// struct to handle the movie data
struct Movie: Decodable, Identifiable {
    var id: Int
    var title: String
    var voteAverage: Double
    var voteCount: Int
    var overview: String
    var runtime: Int?
    var posterPath: String?
    var backdropPath: String?
    var releaseDate: String?
    
    var backdropURL: URL {
        return URL(string: "\(API.imageBaseUrl)\(backdropPath ?? "")")!
    }
    var posterURL: URL {
        return URL(string: "\(API.imageBaseUrl)\(posterPath ?? "")")!
    }

    var ratingText: String {
        let rating = Int(voteAverage)
        let ratingText = (0..<rating).reduce("") { (acc, _) -> String in
            return acc + "🎖"
        }
        return ratingText
    }
    var scoreText: String {
        guard ratingText.count > 0 else {
            return ""
        }
        return "\(ratingText.count)/10"
    }
    var yearText: String {
        guard let releaseDate = self.releaseDate, let date = Formatters.dateFormatter.date(from: releaseDate) else {
            return ""
        }
        return Formatters.yearFormatter.string(from: date)
    }
    var durationText: String {
        guard let runtime = self.runtime, runtime > 0 else {
            return ""
        }
        return Formatters.durationFormatter.string(from: TimeInterval(runtime)*60) ?? ""
    }
    //Coding keys enum
    private enum CodingKeys: String, CodingKey {
        case id = "id"
        case title = "title"
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
        case overview = "overview"
        case runtime = "runtime"
        case posterPath = "poster_path"
        case backdropPath = "backdrop_path"
        case releaseDate = "release_date"
    }
}

// struct to handle movie response data
struct MovieResponse: Decodable {
    var results: [Movie]
    //Coding keys enum
    private enum CodingKeys: String, CodingKey {
        case results = "results"
    }
}
