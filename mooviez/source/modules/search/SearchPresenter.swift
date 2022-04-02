//
//  SearchPresenter.swift
//  mooviez
//
//  Created by Betül Çalık on 31.03.2022.
//

import Foundation

class SearchPresenter: SearchPresenterProtocol {
    
    // MARK: - Variables
    unowned var view: SearchViewProtocol?
    private let interactor: SearchInteractorProtocol
    private let router: SearchRouterProtocol
    private var movies: [Movie] = []
    
    init(view: SearchViewProtocol?,
         interactor: SearchInteractorProtocol,
         router: SearchRouterProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
        self.interactor.delegate = self
    }
    
    func load() {
        interactor.load()
    }
    
    func searchMovie(query: String) {
        interactor.getSearchedMovies(query: query)
    }
    
    func selectMovie(at index: Int) {
        guard let view = view else { return }
        router.navigateToDetail(with: movies[index], on: view)
    }
}

// MARK: - Search Interactor Delegate
extension SearchPresenter: SearchInteractorDelegate {
    
    func handleOutput(_ output: SearchInteractorOutput) {
        switch output {
        case .showMovies(let movies):
            self.movies = movies
            view?.handleOutput(.showMovies(movies))
        case .showSearchedMovies(let searchedMovies):
            self.movies.removeAll()
            self.movies = searchedMovies
            view?.handleOutput(.showSearchedMovies(searchedMovies))
        }
    }

}
