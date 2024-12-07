//
//  Movie.swift
//  MVVM-Coordinator
//
//  Created by shashank mishra on 07/12/24.
//

import Foundation

struct MovieResponse: Decodable {
    let results: [Movie]
}

struct Movie: Decodable, Equatable, Identifiable {
    let id: Int
    let title: String
    let overview: String
}

struct MovieCreditsResponse: Decodable {
    let cast: [MovieCastMember]
}

struct MovieCastMember: Identifiable, Equatable, Decodable {
    let id: Int
    let name: String
    let character: String
}

