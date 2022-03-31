//
//  HomeDetailPresenter.swift
//  mooviez
//
//  Created by Betül Çalık on 26.03.2022.
//

import Foundation

class HomeDetailPresenter: HomeDetailPresenterProtocol {
    
    // MARK: - Variables
    unowned var view: HomeDetailViewProtocol?
    private let router: HomeDetailRouterProtocol
    private let movie: Movie
    
    init(view: HomeDetailViewProtocol?,
         movie: Movie,
         router: HomeDetailRouterProtocol) {
        self.view = view
        self.movie = movie
        self.router = router
    }
    
    func load() {
        view?.handleOutput(.showMovieDetail(movie))
    }
    
    func navigateToMovieVideo() {
        guard let view = view else { return }
        router.navigateToMovieVideo(with: movie.id, on: view)
    }
    
}
