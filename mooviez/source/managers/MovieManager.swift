//
//  MovieManager.swift
//  mooviez
//
//  Created by Betül Çalık on 27.02.2022.
//

import Foundation

final class MovieManager {
    
    // MARK: - Variables
    static let shared = MovieManager()
    private let apiManager = APIManager.shared
    private let baseURL = "https://api.themoviedb.org/3/movie/"
    private let apiKey = "7bc13f9bf8f8b7b8042cbca270f41011"
    private let language = "en-US"
    
    func getUpcomingMovies(completionHandler: @escaping (Result<[UpcomingMovie], Error>) -> Void) {
        let urlString = baseURL + "upcoming?api_key=" + apiKey + "&language=" + language + "&page=1"
        
        apiManager.getRequest(urlString, decodable: UpcomingMovieResponse.self) { (result) in
            switch result {
            case .success(let data):
                completionHandler(.success(data.results))
            case .failure(let error):
                completionHandler(.failure(error))
            }
        }

    }
}
