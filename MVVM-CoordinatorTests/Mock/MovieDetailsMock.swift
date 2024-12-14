//
//  MovieDetailsMock.swift
//  MVVM-CoordinatorTests
//
//  Created by shashank mishra on 07/12/24.
//

import Foundation
@testable import MVVM_Coordinator

class MovieDetailsMockService: MovieDetailsServicing {
    
    var getCallCount = 0
    var getMovieArgument: Movie?
    func getDetails(for movie: Movie) async throws -> MovieDetails? {
        getCallCount += 1
        getMovieArgument = movie
        
        // Simulate a delay to mimic a network call
        try await Task.sleep(nanoseconds: 500_000_000) // 0.5 seconds
        
        let movieDetails = MovieDetails(genres: [Genre(id: 12, name: "Sci")], id: 123, originalLanguage: "English", originalTitle: "XYZ", overview: "Nothing", posterPath: "x", releaseDate: "14 dec", spokenLanguages: [SpokenLanguage(englishName: "English", iso639_1: "s", name: "English")])
        
        return movieDetails
    }
    
    func getPosterImageData(with path: String) async throws -> Data? {
        let posterData = Data()
        
        // Simulate a delay to mimic a network call
        try await Task.sleep(nanoseconds: 500_000_000) // 0.5 seconds
        
        return posterData
    }
}

