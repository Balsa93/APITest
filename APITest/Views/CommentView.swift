//
//  ContentView.swift
//  APITest
//
//  Created by Balsa Komnenovic on 27.12.22..
//

import SwiftUI
import Alamofire

struct CommentView: View {
    @ObservedObject private var viewModel = CommentViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(viewModel.comments) { comment in
                        NavigationLink {
                            DetailCommentView(commentModel: comment)
                        } label: {
                            CommentRow(commentModel: comment)
                        }
                    }
                }
            }.onAppear {
                viewModel.fetchComments()
            }
            .navigationTitle("Comment List")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        CommentView()
    }
}
