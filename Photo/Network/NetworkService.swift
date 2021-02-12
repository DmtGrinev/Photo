//
//  NetworkService.swift
//  PhotoHMNrFeUyTSCDKIxZZhws1hjua16Hu_X8z1zJs3bvEjc
//
//  Created by Tim Grinev on 11.02.2021.
//

import Foundation

class NetworkService {
    
    func request(completion: @escaping (Data?, Error?) -> Void) {
        
        let parameters = self.prepareParameters()
        let url = self.url(params: parameters)
        var request = URLRequest(url: url)
        request.allHTTPHeaderFields = prepareHeader()
        request.httpMethod = "get"
        let task = createDataTask(from: request, completion: completion)
        task.resume()
    }
    
    private func prepareHeader() -> [String: String]? {
        var headers = [String: String]()
        headers["Authorization"] = "Client-ID HMNrFeUyTSCDKIxZZhws1hjua16Hu_X8z1zJs3bvEjc"
        return headers
    }
    
    private func prepareParameters() -> [String: String] {
        var parameters = [String: String]()
      //  parameters["query"] = String?
        parameters["count"] = String(0)
        parameters["orientation"] = "portrait"
        return parameters
    }
    
    private func url(params: [String: String]) -> URL {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.unsplash.com"
        components.path = "/search/photos"
        components.queryItems = params.map {URLQueryItem(name: $0, value: $1)}
        return components.url!
    }
    
    private func createDataTask(from request: URLRequest, completion: @escaping (Data?, Error?) -> Void) -> URLSessionDataTask {
        return URLSession.shared.dataTask(with: request) { (data, response, error) in
            DispatchQueue.main.async {
                completion(data, error)
            }
        }
    }
}
