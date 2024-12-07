//
//  MovieDetailsViewController.swift
//  MVVM-Coordinator
//
//  Created by shashank mishra on 07/12/24.
//

import UIKit

class MovieDetailsViewController: UIViewController {

    weak var coordinator: MainCoordinator?

    var viewModel: MovieDetailsViewModel!

    @IBOutlet weak var overviewLabel: UILabel!
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var genresLabel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    @IBOutlet weak var languagesLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = viewModel.movie.title
        overviewLabel.text = viewModel.movie.overview

        loadMovieDetails()
    }
    
    private func loadMovieDetails() {
        Task {
            await viewModel.fetchData()
            updateDetailsOnView()
            loadImage()
        }
    }
    
    private func loadImage() {
        Task {
            await viewModel.getPosterImageData()
            guard let imageData = viewModel.imageData,
                    let image = UIImage(data: imageData) else {
                return
            }
            DispatchQueue.main.async {
                self.posterImageView.image = image
            }
        }
    }
    
    private func updateDetailsOnView() {
        overviewLabel.text = viewModel.movieDetails?.overview ?? "-"
        genresLabel.text = viewModel.movieDetails?.genres.map { $0.name }.joined(separator: ", ")
        releaseDateLabel.text = viewModel.movieDetails?.releaseDate
        languagesLabel.text = viewModel.movieDetails?.spokenLanguages.map { $0.englishName }.joined(separator: ", ")
    }
}
