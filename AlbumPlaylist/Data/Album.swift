//
//  Album.swift
//  AlbumPlaylist
//
//  Created by Muznah Adil on 2026-07-15.


import Foundation

// The top level object returned by the iTunes Search API.
struct Albums: Codable {
    var results: [Album] = []
}

// One album record from the results array.
struct Album: Codable, Hashable, Identifiable {

    // A sample album used by the previews
    static let album = Album(
        collectionId: 1,
        collectionName: "Muznah's Album",
        artistName: "My Artist",
        copyright: "℗ 2026 My Example Record Label, under exclusive licence to My Example Distributor",
        artworkUrl100: "https://is1-ssl.mzstatic.com/image/thumb/Music116/v4/b4/c9/1c/b4c91c53-77eb-4fb2-1a2c-13b4a0a00c7c/source/100x100bb.jpg",
        collectionExplicitness: "explicit",
        collectionViewUrl: "https://music.apple.com",
        primaryGenreName: "Pop",
        trackCount: 12
    )

    var collectionId: Int
    var collectionName: String
    var artistName: String
    
    // These fields are not be available for every record.
    var copyright: String?
    var artworkUrl100: String?
    var collectionExplicitness: String?
    var collectionViewUrl: String?
    var primaryGenreName: String?
    var trackCount: Int?
}

//collectionId uniquely identifies an album.
extension Album {
    var id: Int {
        return collectionId
    }
}
