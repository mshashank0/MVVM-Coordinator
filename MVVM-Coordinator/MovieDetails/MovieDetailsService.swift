//
//  MovieDetailsService.swift
//  MVVM-Coordinator
//
//  Created by shashank mishra on 07/12/24.
//

import UIKit

protocol MovieDetailsServicing {
    func getDetails(for movie: Movie) async throws -> MovieDetails?
    func getPosterImageData(with path: String) async throws -> Data? 
}

class MovieDetailsService: MovieDetailsServicing {
    
    private let jsonDecoder = JSONDecoder()

    func getDetails(for movie: Movie) async throws -> MovieDetails? {
        let url = URL(string: "\(baseUrl)/\(movie.id)?api_key=\(apiKey)")!

        let (data, _) = try await URLSession.shared.data(from: url)
        return try jsonDecoder.decode(MovieDetails.self, from: data)
    }
    
    func getPosterImageData(with path: String) async throws -> Data? {
        guard let url = URL(string: "https://image.tmdb.org/t/p/w500/\(path)") else {
            return nil
        }
        let (data, _) = try await URLSession.shared.data(from: url)
        return data
    }
}
