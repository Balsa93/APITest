//
//  CommentRow.swift
//  APITest
//
//  Created by Balsa Komnenovic on 27.12.22..
//

import SwiftUI

struct CommentRow: View {
    var commentModel: CommentModel
    
    var body: some View {
        VStack {
            Text(String(commentModel.id ?? 0))
                .font(.largeTitle)
            Spacer()
            Text(commentModel.name ?? "NAME")
                .font(.title)
            Text(commentModel.email ?? "EMAIL")
                .font(.title2)
            Spacer()
            Text(commentModel.body ?? "BODY")
                .font(.body)
            Spacer()
        }
    }
}

struct CommentRow_Previews: PreviewProvider {
    static var previews: some View {
        CommentRow(commentModel: CommentModel(postID: 1, id: 1, name: "Marko", email: "marko@gmail.com", body: "Testing object Testing object Testing object Testing object Testing object Testing object Testing object Testing object Testing object Testing object Testing object Testing object."))
    }
}
