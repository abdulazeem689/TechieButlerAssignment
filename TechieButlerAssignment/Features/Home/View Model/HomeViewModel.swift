//
//  HomeViewModel.swift
//  TechieButlerAssignment
//
//  Created by Abdul Azeem on 01/05/24.
//

import Foundation

final class HomeViewModel: ObservableObject {
    // MARK: - Properties
    @Published private(set) var posts: [PostModel] = []
    let batchLimit = 10
    let dispatchGroup = DispatchGroup()
    
    // MARK: - Initializer
    init() {
        self.getPostBatch()
    }
    
    // MARK: - Functions
    /// Used to fech posts in batches of 10.
    func getPostBatch() {
        var postBatch = [PostModel]()
        var postNumber = 1
        while postNumber <= batchLimit {
            dispatchGroup.enter()
            RequestHandler.shared.handleRequest(posts.count + postNumber) { [weak self] post in
                if post.id != nil { postBatch.append(post) }
                self?.dispatchGroup.leave()
            }
            postNumber += 1
        }
        
        dispatchGroup.notify(queue: .main) { [weak self] in
            self?.posts += postBatch.sorted(by: { $0.id ?? -1 < $1.id ?? -1 })
        }
    }
}
