//
//  CommentsViewService.swift
//  APITest
//
//  Created by Balsa Komnenovic on 27.12.22..
//

import Foundation

protocol CommentViewServiceDelegate {
    func getComments(completion: @escaping(Result<[CommentModel], NetworkError>) -> Void)
}

class CommentViewService: CommentViewServiceDelegate {
    func getComments(completion: @escaping(Result<[CommentModel], NetworkError>) -> Void) {
        RestAPIClient.getComments(completion: completion)
    }
}
