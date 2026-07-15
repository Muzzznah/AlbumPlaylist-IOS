//
//  Album.swift
//  AlbumPlaylist
//
//  Created by Muznah Adil on 2026-07-15.
//

import Foundation

//Wrapper struct that matches the top level of the iTunes JSON result
struct Albums: Codable {
    var results: [Album] = []
}

//Represents a single album returned from the iTunes Search API
struct Album: Codable, Hashable, Identifiable {

    var collectionId: Int
    var collectionName: String
    var artistName: String
    var artworkUrl100: String
    var primaryGenreName: String
    var trackCount: Int
    //Not every album result includes a copyright value
    var copyright: String?
}

//Computed property so Album can conform to Identifiable using the iTunes id
extension Album {
    var id: Int {
        return collectionId
    }
}
