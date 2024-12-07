//
//  ViewControllerProvider.swift
//  MVVM-Coordinator
//
//  Created by shashank mishra on 07/12/24.
//

import Foundation
import UIKit

enum ViewControllerProvider {
    static var moviesListViewController: MoviesListViewController {
        let service: MoviesServicable = MoviesService()
        let viewModel = MoviesViewModel(service: service)
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "MoviesList") as! MoviesListViewController
        viewController.viewModel = viewModel
        return viewController
    }
    
    static func movieDetailsController(for movie: Movie) -> MovieDetailsViewController {
        let service: MovieDetailsServicing = MovieDetailsService()
        let viewModel = MovieDetailsViewModel(movie: movie,service: service)
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "MovieDetails") as! MovieDetailsViewController
        viewController.viewModel = viewModel
        return viewController
    }
}
