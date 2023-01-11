//
//  CommentViewModel.swift
//  APITest
//
//  Created by Balsa Komnenovic on 27.12.22..
//

import Foundation

class CommentViewModel: ObservableObject {
    private let commentViewService: CommentViewServiceDelegate
    init(commentViewService: CommentViewServiceDelegate = CommentViewService()) {
        self.commentViewService = commentViewService
    }
    
    @Published var comments = [CommentModel]()
    
    func fetchComments() {
        commentViewService.getComments { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let comments):
                    self.comments = comments
                case .failure(let error):
                    print(error)
                }
            }
        }
    }
}
