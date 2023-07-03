//
//  NetworkManager.swift
//  PurchaseList
//
//  Created by Macbook Pro on 28/06/23.
//

import Foundation
import Alamofire

class NetworkService {
    
    private init() { }
    
    static let shared = NetworkService()
    
    private let baseURL = "https://localhost:7173/api/"
    
    func get<T: Codable>(endpoint: String, ofType type: T.Type, completion: @escaping (Result<T, Error>) -> Void) {
        let headers: HTTPHeaders = [
            .accept("text/plain")
        ]
        
        AF
            .request("\(baseURL)\(endpoint)", headers: headers)
            .responseData { response in
                switch response.result {
                case .success(let data):
                    let decoder = JSONDecoder()
                    decoder.dateDecodingStrategy = .iso8601
                    do {
                        let decodedResponse = try decoder.decode(T.self, from: data)
                        completion(.success(decodedResponse))
                    } catch {
                        completion(.failure(error))
                    }
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }
    
    func post(endpoint: String, parameters: Parameters, completion: @escaping (Error?) -> Void) {
        let headers: HTTPHeaders = [
            .accept("text/plain")
        ]
        
        AF
            .request(
                "\(baseURL)\(endpoint)",
                method: .post,
                parameters: parameters,
                encoding: JSONEncoding.default,
                headers: headers
            )
            .response { response in
                switch response.result {
                case .success(_):
                    completion(nil)
                case .failure(let error):
                    completion(error)
                }
            }
    }
}
