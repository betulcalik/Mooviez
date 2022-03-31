//
//  MovieVideo.swift
//  mooviez
//
//  Created by Betül Çalık on 31.03.2022.
//

import Foundation

struct MovieVideo: Codable {
    let id: String?
    let key: String?
    let name: String?
    let site: String?
    let type: String?
}

struct MovieVideoResponse: Codable {
    let id: Int?
    let results: [MovieVideo]?
}
