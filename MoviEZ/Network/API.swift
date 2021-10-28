//
//  API.swift
//  MoviEZ
//
//  Created by Felipe Rivera on 25/10/21.
//

import Foundation

// struct for API basic info
struct API {
    static let key = Bundle.main.object(forInfoDictionaryKey: "API_KEY") as? String
    static let baseUrl = "https://api.themoviedb.org/3"
    static let imageBaseUrl = "https://image.tmdb.org/t/p/w500"
    static let youtubeBaseUrl = "https://youtube.com/watch?v="
}
