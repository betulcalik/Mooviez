//
//  HomeInteractor.swift
//  mooviez
//
//  Created by Betül Çalık on 27.02.2022.
//

import Foundation

final class HomeInteractor: HomeInteractorProtocol {
    
    // MARK: - Variables
    weak var delegate: HomeInteractorDelegate?
    var presenter: HomePresenterProtocol?
    private let movieManager = MovieManager.shared

    func load() {
        getUpcomingMovies()
        getTopRatedMovies()
        getTrendingMovies()
    }
    
    func getUpcomingMovies() {
        movieManager.getUpcomingMovies { (result) in
            switch result {
            case .success(let data):
                self.delegate?.handleOutput(.showUpcomingMovies(data))
            case .failure(_):
                break
            }
        }
    }
    
    func getTopRatedMovies() {
        movieManager.getTopRatedMovies { (result) in
            switch result {
            case .success(let data):
                self.delegate?.handleOutput(.showTopRatedMovies(data))
            case .failure(_):
                break
            }
        }
    }
    
    func getTrendingMovies() {
        movieManager.getTrendingMovies { (result) in
            switch result {
            case .success(let data):
                self.delegate?.handleOutput(.showTrendingMovies(data))
            case .failure(_):
                break
            }
        }
    }
}
