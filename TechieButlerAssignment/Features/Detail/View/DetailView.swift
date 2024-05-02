//
//  DetailView.swift
//  TechieButlerAssignment
//
//  Created by Abdul Azeem on 01/05/24.
//

import SwiftUI

struct DetailView: View {
    // MARK: - Properties
    let post: PostModel
    
    // MARK: - Body
    var body: some View {
        List {
            Text("id:  \(post.id ?? -1)")
            Text("userId:  \(post.userId ?? -1)")
            Text("title:  \(post.title ?? "")")
            Text("body:  \(post.body ?? "")")
        }
        .navigationTitle("Post Detail")
    }
}
