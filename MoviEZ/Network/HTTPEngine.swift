//
//  HTTPEngine.swift
//  MoviEZ
//
//  Created by Felipe Rivera on 26/10/21.
//

import Foundation

// protocol for http url request
protocol HTTPEngine {
    var urlSession: URLSession {get set}
}
// extension for fetching the data 
extension HTTPEngine {
    func fetch<D:Decodable>(urlSession: URLSession, url: URL, queryParams: [String:String]? = nil, completion:@escaping (Result<D,NetworkError>) -> Void) {
        
        guard var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: false)
        else {
            completion(.failure(.invalid))
            return
        }
        
        var queryItems = ["api_key":API.key!]
        if let params = queryParams {
            queryItems.merge(dict: params)
        }
        urlComponents.setQueryItems(with: queryItems)
        guard let finalUrl = urlComponents.url else {
            completion(.failure(.invalid))
            return
        }
        
        urlSession.dataTask(with: finalUrl) { (data, response, error) in
            if error != nil {
                completion(.failure(.internalError))
                return
            }
            guard let httpResponse = response as? HTTPURLResponse, 200..<300 ~= httpResponse.statusCode else {
                completion(.failure(.invalid))
                return
            }
            if data == nil {
                completion(.failure(.notFound))
                return
            }
            do {
                let result = try JSONDecoder().decode(D.self, from: data!)
                DispatchQueue.main.async {
                    completion(.success(result))
                }
            } catch {
                completion(.failure(.apiError))
            }
        }.resume()
    }
}
// extension for setting query parameters
extension URLComponents {
    mutating func setQueryItems(with parameters: [String: String]) {
        self.queryItems = parameters.map { URLQueryItem(name: $0.key, value: $0.value) }
    }
}
// extension for merge dictionaries
extension Dictionary {
    mutating func merge(dict: [Key: Value]){
        for (k, v) in dict {
            updateValue(v, forKey: k)
        }
    }
}
