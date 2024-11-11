//
//  Server.swift
//  AppTestMovies
//
//  Created by Mario Vargas on 09/11/24.
//

import Foundation

class Server {
    
    public static let sharedInstance = Server()
    
    
    func simpleService(fromUrlString urlString: String, operationCode: Int, completion:  @escaping(_ operationCode: Int, Result<Data, Error>) -> Void ) {
        if let url = URL(string: urlString) {
            let urlSession = URLSession(configuration: .default).dataTask(with: url) { data, response, error in
                if let error = error {
                    completion(operationCode, .failure(error))
                }
                
                if let data = data {
                    completion(operationCode, .success(data))
                }
            }
            urlSession.resume()
        }
    }
}
