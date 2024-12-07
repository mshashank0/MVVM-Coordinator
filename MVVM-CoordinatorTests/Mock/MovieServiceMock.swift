//
//  MovieServiceMock.swift
//  MVVM-CoordinatorTests
//
//  Created by shashank mishra on 07/12/24.
//

import Foundation
@testable import MVVM_Coordinator

class MoviesMockService: MoviesServicable {
    func getMovies() async throws -> MovieResponse {
        // Simulate a delay to mimic a network call
        try await Task.sleep(nanoseconds: 500_000_000) // 0.5 seconds
        
        // Return mock data
        return MovieResponse(results: [
            Movie(id: 1, title: "Mock Movie 1", overview: "This is the first mock movie."),
            Movie(id: 2, title: "Mock Movie 2", overview: "This is the second mock movie."),
            Movie(id: 3, title: "Mock Movie 3", overview: "This is the third mock movie.")
        ])
    }
}


