//
//  HomeVideoPresenter.swift
//  mooviez
//
//  Created by Betül Çalık on 31.03.2022.
//

import Foundation

class HomeVideoPresenter: HomeVideoPresenterProtocol {
    
    // MARK: - Variables
    unowned var view: HomeVideoViewProtocol?
    private let interactor: HomeVideoInteractorProtocol
    private let router: HomeVideoRouterProtocol
    private let movieId: Int
    
    init(view: HomeVideoViewProtocol?,
         interactor: HomeVideoInteractorProtocol,
         router: HomeVideoRouterProtocol,
         movieId: Int) {
        self.view = view
        self.interactor = interactor
        self.router = router
        self.movieId = movieId
        self.interactor.delegate = self
    }
    
    func load() {
        interactor.load()
    }
    
}

// MARK: - Home Video Interactor Delegate
extension HomeVideoPresenter: HomeVideoInteractorDelegate {
    
    func handleOutput(_ output: HomeVideoInteractorOutput) {
        switch output {
        case .showVideo(let movieVideo):
            view?.handleOutput(.showVideo(movieVideo))
        }
    }
    
}
