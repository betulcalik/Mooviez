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
    let overview: String
    let releaseDate: String
    let originalTitle: String
    let voteCount: Int
    
    private enum CodingKeys: String, CodingKey {
        case id
        case posterPath = "poster_path"
        case overview
        case releaseDate = "release_date"
        case originalTitle = "original_title"
        case voteCount = "vote_count"
    }
}

struct MovieResponse: Codable {
    let page: Int
    let results: [Movie]
}
