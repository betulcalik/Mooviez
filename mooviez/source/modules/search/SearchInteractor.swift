//
//  SearchInteractor.swift
//  mooviez
//
//  Created by Betül Çalık on 31.03.2022.
//

import Foundation

class SearchInteractor: SearchInteractorProtocol {
    
    // MARK: - Variables
    weak var delegate: SearchInteractorDelegate?
    var presenter: SearchPresenterProtocol?
    private let movieManager = MovieManager.shared
    
    func load() {
        getTopRatedMovies()
    }
    
    func getTopRatedMovies() {
        movieManager.getTopRatedMovies { (result) in
            switch result {
            case .success(let data):
                self.delegate?.handleOutput(.showMovies(data))
            case .failure(_):
                break
            }
        }
    }
    
    func getSearchedMovies(query: String) {
        movieManager.getSearchMovie(query: query) { (result) in
            switch result {
            case .success(let data):
                self.delegate?.handleOutput(.showSearchedMovies(data))
            case .failure(_):
                break
            }
        }
    }
    
}
