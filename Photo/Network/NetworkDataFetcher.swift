//
//  NetworkDataFetcher.swift
//  Photo
//
//  Created by Tim Grinev on 11.02.2021.
//

import Foundation

class NetworkDataFetcher {
    
    var networkService = NetworkService()
    
    func fetchPhoto(completion: @escaping (PhotoViewModel?) -> ()) {
    networkService.request { (data, error) in
        if let error = error {
            print("Error", error)
            completion(nil)
        }
        let decode = self.decodeJSON(type: PhotoViewModel.self, from: data)
        completion(decode)
    }
}
    
    func decodeJSON<T: Decodable>(type: T.Type, from: Data?) -> T? {
        let decoder = JSONDecoder()
        guard let data = from else {return nil}
        do {
            let objects = try decoder.decode(type.self, from: data)
            return objects
        } catch let jsonError {
           print("JSON Error", jsonError)
            return nil
        }
    }
}
