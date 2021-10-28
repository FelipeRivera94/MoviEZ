//
//  CreditsWS.swift
//  MoviEZ
//
//  Created by Felipe Rivera on 26/10/21.
//

import Foundation

// protocol for credits services
protocol CreditsWS {
    func fetchCredits(from movieId: Int, completion: @escaping (Result<CreditsResponse,NetworkError>) -> Void)
}
