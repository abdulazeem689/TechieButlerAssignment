//
//  RequestHandler.swift
//  TechieButlerAssignment
//
//  Created by Abdul Azeem on 01/05/24.
//

import Foundation

final class RequestHandler {
    static let shared = RequestHandler()
    
    let baseUrl = "https://jsonplaceholder.typicode.com"
    
    func handleRequest(_ postNumber: Int, completion: @escaping (PostModel) -> Void) {
        let endpoint = baseUrl + "/posts/" + String(postNumber)
        guard let url = URL(string: endpoint) else { return }
        URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            if let data_ = data {
                do {
                    let post =  try JSONDecoder().decode(PostModel.self, from: data_)
                    completion(post)
                } catch {}
            }
        }.resume()
    }
}
