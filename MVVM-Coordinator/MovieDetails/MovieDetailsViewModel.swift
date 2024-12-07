//
//  MovieDetailsViewModel.swift
//  MVVM-Coordinator
//
//  Created by shashank mishra on 07/12/24.
//

import Foundation
import Combine

class MovieDetailsViewModel {
    
    // Publisher for the movies
    @Published private(set) var movieDetails: MovieDetails?
    // Publisher for image data
    @Published private(set) var imageData: Data?
    // Combine cancellables
    private var cancellables = Set<AnyCancellable>()
    private let service: MovieDetailsServicing
    let movie: Movie

    init(movie: Movie, service: MovieDetailsServicing) {
        self.movie = movie
        self.service = service
    }

    func fetchData() async {
        do {
            let response = try await service.getDetails(for: movie)
            movieDetails = response
        } catch {
            print("Error fetching movies: \(error)")
        }
    }
    
    func getPosterImageData() async {
        do {
            let imageData = try await service.getPosterImageData(with: movieDetails?.posterPath ?? "")
            self.imageData = imageData
        } catch {
            print("Error fetching image data: \(error)")
        }
    }
}
