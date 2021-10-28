//
//  VideoWS.swift
//  MoviEZ
//
//  Created by Felipe Rivera on 26/10/21.
//

import Foundation

// protocol for credits services
protocol VideoWS {
    func fetchVideos(from movieId: Int, completion: @escaping (Result<VideoResponse,NetworkError>) -> Void)
}
