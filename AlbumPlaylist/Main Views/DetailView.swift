//
//  DetailView.swift
//  AlbumPlaylist
//
//  Created by Muznah Adil on 2026-07-15.
//

import Foundation
import SwiftUI

struct DetailView: View {
    let album: Album
    var albumStore: AlbumStore

    var body: some View {
        ScrollView {
            VStack {
                // The album name.
                Text(album.collectionName)
                    .bold()
                    .font(.title)
                    .multilineTextAlignment(.center)

                // The provided album image.
                AsyncImage(url: URL(string: album.artworkUrl100 ?? "")) { result in
                    if let image = result.image {
                        image
                            .resizable()
                            .clipShape(RoundedRectangle(cornerRadius: 5, style: .circular))
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 200, height: 200)
                    } else if result.error != nil {
                        Image(systemName: "photo")
                            .font(.largeTitle)
                    } else {
                        ProgressView()
                    }
                }

                // The artist name.
                Text(album.artistName)
                    .font(.title3)
                    .fontWeight(.black)

                // An image that represents whether the album is explicit or not.
                if album.collectionExplicitness == "explicit" {
                    Image(systemName: "e.square.fill")
                        .font(.title)
                } else {
                    Image(systemName: "c.square.fill")
                        .font(.title)
                }

                Divider()

                // The full copyright description.
                Text(album.copyright ?? "No copyright provided")
                    .italic()
                    .fontWeight(.light)

                Divider()

                // Other information from the API.
                Text("Genre: \(album.primaryGenreName ?? "Not available")")
                Text("Number of tracks: \(album.trackCount ?? 0)")

                // A link to the collection's website.
                if let url = album.collectionViewUrl {
                    NavigationLink("View the Album Website") {
                        WebView(webText: url)
                    }
                }
            }
            Spacer()

        }.padding()
    }
}

#Preview {
    NavigationStack {
        DetailView(album: Album.album, albumStore: AlbumStore.exampleAlbumStore)
    }
}
