//
//  MoviesListViewController..swift
//  MVVM-Coordinator
//
//  Created by shashank mishra on 07/12/24.
//

import UIKit
import Combine

class MoviesListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
   
    weak var coordinator: MainCoordinator?
    var viewModel: MoviesViewModel!
    private var cancellables = Set<AnyCancellable>()
    
    private let cellId = "MovieCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        tableView.delegate = self

        loadMovies()
    }
    
    private func loadMovies() {
        Task {
            await viewModel.fetchMovies()
            tableView.reloadData()
        }
    }
}

extension MoviesListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.movies.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! MovieCell
        let movies = viewModel.movies[indexPath.row]
        cell.titleLabel.text = movies.title
        cell.overviewLabel.text = movies.overview
        return cell
    }
}

extension MoviesListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let movie = viewModel.movies[indexPath.row]
        // Use coordinator to move to details view
        coordinator?.displayDetails(of: movie)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}


