//
//  APIRouter.swift
//  APITest
//
//  Created by Balsa Komnenovic on 27.12.22..
//

import Foundation
import Alamofire

public enum APIRouter: URLRequestConvertible {
    case getComments
    private var urlPath: String {
        switch self {
        case .getComments:
            return "https://jsonplaceholder.typicode.com/comments"
        }
    }
    
    private var method: HTTPMethod {
        switch self {
        case .getComments:
            return .get
        }
    }
    
    public func asURLRequest() throws -> URLRequest {
        let url = try urlPath.asURL()
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method.rawValue
        return urlRequest
    }
}
