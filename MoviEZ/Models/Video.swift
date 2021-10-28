//
//  Video.swift
//  MoviEZ
//
//  Created by Felipe Rivera on 25/10/21.
//

import Foundation

//struct to handle video data
struct Video: Decodable, Identifiable {
    let id: String
    let key: String
    let name: String
    let site: String
    var youtubeURL: URL? {
        guard site == "YouTube" else {
            return nil
        }
        return URL(string: "\(API.youtubeBaseUrl)\(key)")
    }
    //Coding keys enum
    private enum CodingKeys: String, CodingKey {
        case id = "id"
        case key = "key"
        case name = "name"
        case site = "site"
    }
}
//struct to handle video response data
struct VideoResponse: Decodable {
    let results: [Video]
    
    var youtubeTrailers: [Video]? {
        results.filter {
            $0.youtubeURL != nil
        }
    }
    //Coding keys enum
    private enum CodingKeys: String, CodingKey {
        case results = "results"
    }
}
