//
//  MoviesService.swift
//  MVVM-Coordinator
//
//  Created by shashank mishra on 07/12/24.
//

import Foundation

protocol MoviesServicable {
    func getMovies() async throws -> MovieResponse
}

class MoviesService: MoviesServicable {
    private let jsonDecoder = JSONDecoder()

    func getMovies() async throws -> MovieResponse {
        let url = URL(string: "\(baseUrl)/upcoming?api_key=\(apiKey)")!

        let (data, _) = try await URLSession.shared.data(from: url)
        return try jsonDecoder.decode(MovieResponse.self, from: data)
    }
}
