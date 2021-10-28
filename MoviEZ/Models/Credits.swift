//
//  Credits.swift
//  MoviEZ
//
//  Created by Felipe Rivera on 25/10/21.
//

import Foundation

//struct to handle cast name
struct Cast: Decodable, Identifiable {
    let id: Int
    let character: String
    let name: String
    let profilePath: String?
    
    var profileURL: URL {
        return URL(string: "\(API.imageBaseUrl)\(profilePath ?? "")")!
    }
    
    //Coding keys enum
    private enum CodingKeys: String, CodingKey {
        case id = "id"
        case character = "character"
        case name = "name"
        case profilePath = "profile_path"
    }
}
//struct to handle crew name
struct Crew: Decodable, Identifiable {
    let id: Int
    let job: String
    let name: String
    
    //Coding keys enum
    private enum CodingKeys: String, CodingKey {
        case id = "id"
        case job = "job"
        case name = "name"
    }
}
//struct to handle credits response 
struct CreditsResponse: Decodable {
    let cast: [Cast]
    let crew: [Crew]
    
    var directors: [Crew]? {
        crew.filter {
            $0.job.lowercased() ==  "director"
        }
    }
    var producers: [Crew]? {
        crew.filter {
            $0.job.lowercased() ==  "producer"
        }
    }
    var screenWriters: [Crew]? {
        crew.filter {
            $0.job.lowercased() ==  "story"
        }
    }
    
    //Coding keys enum
    private enum CodingKeys: String, CodingKey {
        case cast = "cast"
        case crew = "crew"
    }
}
