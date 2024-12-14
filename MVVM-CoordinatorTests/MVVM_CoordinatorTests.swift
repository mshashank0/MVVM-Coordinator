//
//  MVVM_CoordinatorTests.swift
//  MVVM-CoordinatorTests
//
//  Created by shashank mishra on 07/12/24.
//

import Testing
@testable import MVVM_Coordinator

struct MVVM_CoordinatorTests {

    @Test
    func moviesViewModel() async throws {
        let mockedService = MoviesMockService()
        let viewModel = MoviesViewModel(service: mockedService)

        await viewModel.fetchMovies()
        let count = mockedService.getMoviesCallCount
        #expect(count == 1)
        let movies = viewModel.movies
        #expect(movies.count == 3)
    }
    
    @Test
    func movieDetailsViewModel() async throws {
        let mockedService = MovieDetailsMockService()
        let movie = Movie(id: 1, title: "Mock Movie 1", overview: "Nothing")
        let viewModel = MovieDetailsViewModel(movie: movie, service: mockedService)
        
        await viewModel.fetchData()
        let count = mockedService.getCallCount
        #expect(count == 1)
        #expect(mockedService.getMovieArgument == movie)
        let movieDetails = viewModel.movieDetails
        #expect(movieDetails?.originalLanguage ?? "" == "English")
        #expect(movieDetails?.overview ?? "" == "Nothing")
    }

}
