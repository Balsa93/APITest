//
//  RestAPIClient.swift
//  APITest
//
//  Created by Balsa Komnenovic on 27.12.22..
//

import Foundation
import Alamofire

enum NetworkError: Error {
    case BadURL
    case NoData
    case DecodingError
    case APIError(String)
}

class RestAPIClient {
    static func request<T: Codable>(type: T.Type, route: APIRouter, completion: @escaping(Result<T, NetworkError>) -> Void) {
        AF.request(route).response { response in
            let result = response.result
            switch result {
            case .success(let data):
                guard let data = data else {
                    completion(.failure(.NoData))
                    return
                }
                guard let object = try? JSONDecoder().decode(T.self, from: data) else {
                    completion(.failure(.DecodingError))
                    return
                }
                completion(.success(object))
            case .failure(let error):
                completion(.failure(.APIError(error.localizedDescription)))
            }
        }
    }
    
    static func getComments(completion: @escaping(Result<[CommentModel], NetworkError>) -> Void) {
        return request(type: [CommentModel].self, route: APIRouter.getComments, completion: completion)
    }
}
