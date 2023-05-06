//
//  Results.swift
//  iTunes_API_test
//
//  Created by Maxim Mitin on 6.05.23.
//

import Foundation

//class Welcome: Codable {
//    let resultCount: Int
//    let results: [Result]
//
//}
//
//// MARK: - Result
//class Result: Codable {
//    let wrapperType: WrapperType
//    let artistID, collectionID: Int
//    let amgArtistID: Int?
//    let artistName, collectionName, collectionCensoredName: String
//    let artistViewURL, collectionViewURL: String
//    let artworkUrl60, artworkUrl100: String
//    let collectionPrice: Double
//    let collectionExplicitness: Explicitness
//    let trackCount: Int
//    let copyright: String?
//    let country: Country
//    let currency: Currency
//    let releaseDate: Date
//    let primaryGenreName: String
//    let previewURL: String
//    let description: String?
//    let kind: Kind?
//    let trackID: Int?
//    let trackName, trackCensoredName: String?
//    let trackViewURL: String?
//    let artworkUrl30: String?
//    let trackPrice: Double?
//    let trackExplicitness: Explicitness?
//    let discCount, discNumber, trackNumber, trackTimeMillis: Int?
//    let isStreamable: Bool?
//    let contentAdvisoryRating: String?
//    let collectionArtistID: Int?
//    let collectionArtistName: String?
//
//    enum CodingKeys: String, CodingKey {
//        case wrapperType
//        case artistID = "artistId"
//        case collectionID = "collectionId"
//        case amgArtistID = "amgArtistId"
//        case artistName, collectionName, collectionCensoredName
//        case artistViewURL = "artistViewUrl"
//        case collectionViewURL = "collectionViewUrl"
//        case artworkUrl60, artworkUrl100, collectionPrice, collectionExplicitness, trackCount, copyright, country, currency, releaseDate, primaryGenreName
//        case previewURL = "previewUrl"
//        case description, kind
//        case trackID = "trackId"
//        case trackName, trackCensoredName
//        case trackViewURL = "trackViewUrl"
//        case artworkUrl30, trackPrice, trackExplicitness, discCount, discNumber, trackNumber, trackTimeMillis, isStreamable, contentAdvisoryRating
//        case collectionArtistID = "collectionArtistId"
//        case collectionArtistName
//    }
//
//    init(wrapperType: WrapperType, artistID: Int, collectionID: Int, amgArtistID: Int?, artistName: String, collectionName: String, collectionCensoredName: String, artistViewURL: String, collectionViewURL: String, artworkUrl60: String, artworkUrl100: String, collectionPrice: Double, collectionExplicitness: Explicitness, trackCount: Int, copyright: String?, country: Country, currency: Currency, releaseDate: Date, primaryGenreName: String, previewURL: String, description: String?, kind: Kind?, trackID: Int?, trackName: String?, trackCensoredName: String?, trackViewURL: String?, artworkUrl30: String?, trackPrice: Double?, trackExplicitness: Explicitness?, discCount: Int?, discNumber: Int?, trackNumber: Int?, trackTimeMillis: Int?, isStreamable: Bool?, contentAdvisoryRating: String?, collectionArtistID: Int?, collectionArtistName: String?) {
//        self.wrapperType = wrapperType
//        self.artistID = artistID
//        self.collectionID = collectionID
//        self.amgArtistID = amgArtistID
//        self.artistName = artistName
//        self.collectionName = collectionName
//        self.collectionCensoredName = collectionCensoredName
//        self.artistViewURL = artistViewURL
//        self.collectionViewURL = collectionViewURL
//        self.artworkUrl60 = artworkUrl60
//        self.artworkUrl100 = artworkUrl100
//        self.collectionPrice = collectionPrice
//        self.collectionExplicitness = collectionExplicitness
//        self.trackCount = trackCount
//        self.copyright = copyright
//        self.country = country
//        self.currency = currency
//        self.releaseDate = releaseDate
//        self.primaryGenreName = primaryGenreName
//        self.previewURL = previewURL
//        self.description = description
//        self.kind = kind
//        self.trackID = trackID
//        self.trackName = trackName
//        self.trackCensoredName = trackCensoredName
//        self.trackViewURL = trackViewURL
//        self.artworkUrl30 = artworkUrl30
//        self.trackPrice = trackPrice
//        self.trackExplicitness = trackExplicitness
//        self.discCount = discCount
//        self.discNumber = discNumber
//        self.trackNumber = trackNumber
//        self.trackTimeMillis = trackTimeMillis
//        self.isStreamable = isStreamable
//        self.contentAdvisoryRating = contentAdvisoryRating
//        self.collectionArtistID = collectionArtistID
//        self.collectionArtistName = collectionArtistName
//    }
//}
//
//enum Explicitness: String, Codable {
//    case explicit = "explicit"
//    case notExplicit = "notExplicit"
//}
//
//enum Country: String, Codable {
//    case usa = "USA"
//}
//
//enum Currency: String, Codable {
//    case usd = "USD"
//}
//
//enum Kind: String, Codable {
//    case song = "song"
//}
//
//enum WrapperType: String, Codable {
//    case audiobook = "audiobook"
//    case track = "track"
//}


struct Response: Decodable {

    let results: [Result]

    struct Result: Decodable {
        let artistName: String
        let trackName: String
    }
}
