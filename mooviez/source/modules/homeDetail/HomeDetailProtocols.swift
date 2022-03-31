//
//  HomeDetailProtocols.swift
//  mooviez
//
//  Created by Betül Çalık on 26.03.2022.
//

import Foundation

// MARK: - View
protocol HomeDetailViewProtocol: AnyObject {
    var presenter: HomeDetailPresenterProtocol? { get set }
    
    func handleOutput(_ output: HomeDetailPresenterOutput)
}

// MARK: - Presenter
protocol HomeDetailPresenterProtocol: AnyObject {
    func load()
    func navigateToMovieVideo()
}

enum HomeDetailPresenterOutput {
    case showMovieDetail(Movie)
}

// MARK: - Router
protocol HomeDetailRouterProtocol: AnyObject {
    static func build(with movie: Movie) -> HomeDetailViewProtocol
    func navigateToMovieVideo(with movieId: Int, on view: HomeDetailViewProtocol)
}
