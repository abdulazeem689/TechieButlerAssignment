//
//  HomeView.swift
//  TechieButlerAssignment
//
//  Created by Abdul Azeem on 01/05/24.
//

import SwiftUI

struct HomeView: View {
    // MARK: - Properties
    @ObservedObject var viewModel = HomeViewModel()
    
    // MARK: - Body
    var body: some View {
        NavigationStack {
            List {
                if viewModel.posts.isEmpty {
                    ProgressView("Loading...")
                        .frame(maxWidth: .infinity, alignment: .center)
                }
                ForEach(viewModel.posts) { post in
                    NavigationLink(destination: DetailView(post: post)) {
                        Text("\(post.id ?? -1). \(post.title ?? "")")
                    }
                }
                if viewModel.posts.count > 0 && viewModel.posts.count < 100 {
                    ProgressView("Loading more data...")
                        .frame(maxWidth: .infinity, alignment: .center)
                        .onAppear {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) { viewModel.getPostBatch() }
                        }
                }
            }
            .listStyle(.plain)
            .navigationTitle("Posts")
        }
    }
}

#Preview {
    HomeView()
}
