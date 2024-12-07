//
//  MovieDetailsMock.swift
//  MVVM-CoordinatorTests
//
//  Created by shashank mishra on 07/12/24.
//

import Foundation
@testable import MVVM_Coordinator

// TODO
class MovieDetailsMockService: MovieDetailsServicing {
    func getDetails(for movie: Movie) async throws -> MovieDetails? {
        return nil
    }
    
    func getPosterImageData(with path: String) async throws -> Data? {
        return nil
    }
}

