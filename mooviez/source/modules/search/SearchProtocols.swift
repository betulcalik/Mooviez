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
}

protocol SearchInteractorDelegate: AnyObject {
    func handleOutput(_ output: SearchInteractorOutput)
}

enum SearchInteractorOutput {
    case showMovies([Movie])
}

// MARK: - Presenter
protocol SearchPresenterProtocol: AnyObject {
    func load()
}

enum SearchPresenterOutput {
    case showMovies([Movie])
}

// MARK: - Router
protocol SearchRouterProtocol: AnyObject {
    static func build() -> SearchViewProtocol
}
