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
    
}

// MARK: - Search Interactor Delegate
extension SearchPresenter: SearchInteractorDelegate {
    
    func handleOutput(_ output: SearchInteractorOutput) {
        switch output {
        case .showMovies(let movies):
            view?.handleOutput(.showMovies(movies))
        }
    }

}
