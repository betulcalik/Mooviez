//
//  HomePresenter.swift
//  mooviez
//
//  Created by Betül Çalık on 27.02.2022.
//

import Foundation

final class HomePresenter: HomePresenterProtocol {
    
    // MARK: - Variables
    unowned var view: HomeViewProtocol?
    private let interactor: HomeInteractorProtocol
    private let router: HomeRouterProtocol
    
    init(view: HomeViewProtocol,
         interactor: HomeInteractorProtocol,
         router: HomeRouterProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
        self.interactor.delegate = self
    }
    
    func load() {
        interactor.load()
    }

    func selectMovie(with movieType: MovieType, at index: Int) {
        interactor.selectMovie(with: movieType, at: index)
    }
}

// MARK: - Home Interactor Delegate
extension HomePresenter: HomeInteractorDelegate {
    
    func handleOutput(_ output: HomeInteractorOutput) {
        switch output {
        case .showUpcomingMovies(let upcomingMovieResponse):
            view?.handleOutput(.showUpcomingMovies(upcomingMovieResponse))
        case .showTopRatedMovies(let topRatedMoviesResponse):
            view?.handleOutput(.showTopRatedMovies(topRatedMoviesResponse))
        case .showTrendingMovies(let trendingMoviesResponse):
            view?.handleOutput(.showTrendingMovies(trendingMoviesResponse))
        case .showMovieDetail(let movie):
            guard let view = view else { return }
            router.navigateToDetail(with: movie, on: view)
        }
    }

}
