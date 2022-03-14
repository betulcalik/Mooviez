//
//  HomeProtocols.swift
//  mooviez
//
//  Created by Betül Çalık on 27.02.2022.
//

import Foundation

// MARK: - View
protocol HomeViewProtocol: AnyObject {
    var presenter: HomePresenterProtocol? { get set }

    func handleOutput(_ output: HomePresenterOutput)
}

// MARK: - Interactor
protocol HomeInteractorProtocol: AnyObject {
    var delegate: HomeInteractorDelegate? { get set }
    var presenter: HomePresenterProtocol? { get set }
    
    func load()
    func getUpcomingMovies()
    func getTopRatedMovies()
}

protocol HomeInteractorDelegate: AnyObject {
    func handleOutput(_ output: HomeInteractorOutput)
}

enum HomeInteractorOutput {
    case showUpcomingMovies([Movie])
    case showTopRatedMovies([Movie])
}

// MARK: - Presenter
protocol HomePresenterProtocol: AnyObject {
    func load()
}

enum HomePresenterOutput {
    case showUpcomingMovies([Movie])
    case showTopRatedMovies([Movie])
}

// MARK: - Router
protocol HomeRouterProtocol: AnyObject {
    static func build() -> HomeViewProtocol
}
