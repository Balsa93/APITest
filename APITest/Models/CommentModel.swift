//
//  Model.swift
//  APITest
//
//  Created by Balsa Komnenovic on 27.12.22..
//

import Foundation

struct CommentModel: Codable, Identifiable {
    let postID, id: Int?
    let name, email, body: String?

    enum CodingKeys: String, CodingKey {
        case postID = "postId"
        case id, name, email, body
    }
}
