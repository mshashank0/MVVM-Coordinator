//
//  MovieDetails.swift
//  MVVM-Coordinator
//
//  Created by shashank mishra on 07/12/24.
//

// MARK: - MovieDetails
struct MovieDetails: Codable {
    let genres: [Genre]
    let id: Int
    let originalLanguage, originalTitle, overview: String
    let posterPath: String
    let releaseDate: String
    let spokenLanguages: [SpokenLanguage]

    enum CodingKeys: String, CodingKey {
        case genres, id
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case overview
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case spokenLanguages = "spoken_languages"
    }
}

// MARK: - Genre
struct Genre: Codable {
    let id: Int
    let name: String
}

// MARK: - SpokenLanguage
struct SpokenLanguage: Codable {
    let englishName, iso639_1, name: String

    enum CodingKeys: String, CodingKey {
        case englishName = "english_name"
        case iso639_1 = "iso_639_1"
        case name
    }
}
