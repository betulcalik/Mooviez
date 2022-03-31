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
    private let trendingBaseURL = "https://api.themoviedb.org/3/"
    private let apiKey = "7bc13f9bf8f8b7b8042cbca270f41011"
    private let language = "en-US"
    private let timeWindow = "week"
    let imageBaseURL = "https://image.tmdb.org/t/p/w300"
    
    func getUpcomingMovies(completionHandler: @escaping (Result<[Movie], Error>) -> Void) {
        let urlString = baseURL + "upcoming?api_key=" + apiKey + "&language=" + language + "&page=1"
        
        apiManager.getRequest(urlString, decodable: MovieResponse.self) { (result) in
            switch result {
            case .success(let data):
                completionHandler(.success(data.results))
            case .failure(let error):
                completionHandler(.failure(error))
            }
        }

    }

    func getTopRatedMovies(completionHandler: @escaping (Result<[Movie], Error>) -> Void) {
        let urlString = baseURL + "top_rated?api_key=" + apiKey + "&language" + language + "&page=1"
        
        apiManager.getRequest(urlString, decodable: MovieResponse.self) { (result) in
            switch result {
            case .success(let data):
                completionHandler(.success(data.results))
            case .failure(let error):
                completionHandler(.failure(error))
            }
        }

    }
    
    func getTrendingMovies(completionHandler: @escaping (Result<[Movie], Error>) -> Void) {
        let urlString = trendingBaseURL + "trending/movie/" + timeWindow + "?api_key=" + apiKey
        
        apiManager.getRequest(urlString, decodable: MovieResponse.self) { (result) in
            switch result {
            case .success(let data):
                completionHandler(.success(data.results))
            case .failure(let error):
                completionHandler(.failure(error))
            }
        }

    }
    
    func getMovieVideo(movieId: Int, completionHandler: @escaping (Result<[MovieVideo], Error>) -> Void) {
        let movieIdString = String(movieId)
        let urlString = baseURL + movieIdString + "/videos?api_key=" + apiKey + "&language=" + language
       
        apiManager.getRequest(urlString, decodable: MovieVideoResponse.self) { (result) in
            switch result {
            case .success(let data):
                guard let results = data.results else { return }
                completionHandler(.success(results))
            case .failure(let error):
                completionHandler(.failure(error))
            }
        }
    }
}
