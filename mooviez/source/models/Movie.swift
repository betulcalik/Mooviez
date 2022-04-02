//
//  Movie.swift
//  mooviez
//
//  Created by Betül Çalık on 27.02.2022.
//

import Foundation

struct Movie: Codable {
    let id: Int
    let posterPath: String?
    let backdropPath: String?
    let overview: String
    let releaseDate: String
    let title: String
    let originalTitle: String
    let voteAverage: Double
    
    private enum CodingKeys: String, CodingKey {
        case id
        case posterPath = "poster_path"
        case backdropPath = "backdrop_path"
        case overview
        case releaseDate = "release_date"
        case title
        case originalTitle = "original_title"
        case voteAverage = "vote_average"
    }
}

struct MovieResponse: Codable {
    let page: Int
    let results: [Movie]
}
