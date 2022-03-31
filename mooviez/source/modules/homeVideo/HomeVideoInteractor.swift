//
//  HomeVideoInteractor.swift
//  mooviez
//
//  Created by Betül Çalık on 31.03.2022.
//

import Foundation

class HomeVideoInteractor: HomeVideoInteractorProtocol {
    
    // MARK: - Variables
    weak var delegate: HomeVideoInteractorDelegate?
    var presenter: HomeVideoPresenterProtocol?
    private let movieManager = MovieManager.shared
    private let movieId: Int
    
    init(movieId: Int) {
        self.movieId = movieId
    }
    
    func load() {
        getMovieVideo()
    }
    
    private func getMovieVideo() {
        movieManager.getMovieVideo(movieId: movieId) { (result) in
            switch result {
            case .success(let data):
                guard let data = data.first else { return }
                self.delegate?.handleOutput(.showVideo(data))
            case .failure(_):
                break
            }
        }
    }
    
}
