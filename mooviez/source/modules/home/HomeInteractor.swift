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
    private var upcomingMovies: [Movie] = []
    private var topRatedMovies: [Movie] = []
    private var trendingMovies: [Movie] = []

    func load() {
        getUpcomingMovies()
        getTopRatedMovies()
        getTrendingMovies()
    }
    
    func getUpcomingMovies() {
        movieManager.getUpcomingMovies { (result) in
            switch result {
            case .success(let data):
                self.upcomingMovies = data
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
                self.topRatedMovies = data
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
                self.trendingMovies = data
                self.delegate?.handleOutput(.showTrendingMovies(data))
            case .failure(_):
                break
            }
        }
    }
    
    func selectMovie(with movieType: MovieType, at index: Int) {
        switch movieType {
        case .upcomingMovies:
            let upcomingMovie = upcomingMovies[index]
            delegate?.handleOutput(.showMovieDetail(upcomingMovie))
        case .topRatedMovies:
            let topRatedMovie = topRatedMovies[index]
            delegate?.handleOutput(.showMovieDetail(topRatedMovie))
        case .trendingMovies:
            let trendingMovie = trendingMovies[index]
            delegate?.handleOutput(.showMovieDetail(trendingMovie))
        }
    }
}
