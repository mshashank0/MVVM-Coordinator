//
//  MainCoordinator.swift
//  MVVM-Coordinator
//
//  Created by shashank mishra on 07/12/24.
//

import UIKit

class MainCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let vc = ViewControllerProvider.moviesListViewController
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: false)
    }
    
    func displayDetails(of movie: Movie) {
        let detailsVC = ViewControllerProvider.movieDetailsController(for: movie)
        detailsVC.coordinator = self
        navigationController.pushViewController(detailsVC, animated: true)
    }
}
