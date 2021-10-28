//
//  VideosLoader.swift
//  MoviEZ
//
//  Created by Felipe Rivera on 26/10/21.
//

import Foundation

class VideosLoader: VideoWS, HTTPEngine {
    //urlSession for HTTPEngine protocol
    var urlSession: URLSession = URLSession.shared
    //MARK: init
    // singleton
    private init() {}
    static let shared = VideosLoader()
    //MARK: fetchVideos
    /// fetch trailers for a movie
    /// - parameter movieId: id of the movie in which the trailers will be fetch
    /// - parameter completion: fetching clousure
    func fetchVideos(from movieId: Int, completion: @escaping (Result<VideoResponse, NetworkError>) -> Void) {
        guard let url = URL(string:"\(API.baseUrl)/movie/\(movieId)/videos") else {
            completion(.failure(.invalid))
            return
        }
        fetch(urlSession: urlSession, url: url, completion: completion)
    }
}
