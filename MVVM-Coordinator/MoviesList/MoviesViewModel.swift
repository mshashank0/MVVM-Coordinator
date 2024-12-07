//
//  MoviesViewModel.swift
//  MVVM-Coordinator
//
//  Created by shashank mishra on 07/12/24.
//

import Foundation
import Combine

class MoviesViewModel {
    // Publisher for the movies
    @Published private(set) var movies: [Movie] = []
    // Combine cancellables
    private var cancellables = Set<AnyCancellable>()
    private let service: MoviesServicable

    init(service: MoviesServicable) {
        self.service = service
    }
    
    func fetchMovies() async {
        do {
            let response = try await service.getMovies()
            DispatchQueue.main.async { [weak self] in
                self?.movies = response.results
            }
        } catch {
            print("Error fetching movies: \(error)")
        }
    }
}
