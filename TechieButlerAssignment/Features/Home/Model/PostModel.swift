//
//  PostModel.swift
//  TechieButlerAssignment
//
//  Created by Abdul Azeem on 01/05/24.
//

struct PostModel: Decodable, Identifiable {
    let id: Int?
    let userId: Int?
    let title: String?
    let body: String?
}
