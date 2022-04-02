//
//  SearchProtocols.swift
//  mooviez
//
//  Created by Betül Çalık on 31.03.2022.
//

import Foundation

// MARK: - View
protocol SearchViewProtocol: AnyObject {
    var presenter: SearchPresenterProtocol? { get set }
    
    func handleOutput(_ output: SearchPresenterOutput)
}

// MARK: - Interactor
protocol SearchInteractorProtocol: AnyObject {
    var delegate: SearchInteractorDelegate? { get set }
    var presenter: SearchPresenterProtocol? { get set }
    
    func load()
    func getTopRatedMovies()
    func getSearchedMovies(query: String)
}

protocol SearchInteractorDelegate: AnyObject {
    func handleOutput(_ output: SearchInteractorOutput)
}

enum SearchInteractorOutput {
    case showMovies([Movie])
    case showSearchedMovies([Movie])
}

// MARK: - Presenter
protocol SearchPresenterProtocol: AnyObject {
    func load()
    func searchMovie(query: String)
    func selectMovie(at index: Int)
}

enum SearchPresenterOutput {
    case showMovies([Movie])
    case showSearchedMovies([Movie])
}

// MARK: - Router
protocol SearchRouterProtocol: AnyObject {
    static func build() -> SearchViewProtocol
    func navigateToDetail(with movie: Movie, on view: SearchViewProtocol)
}
