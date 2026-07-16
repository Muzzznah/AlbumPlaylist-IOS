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

    // Controls whether the add/remove alert is showing.
    @State private var alertIsShowing = false

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

                // Button that asks to add or remove the album via an alert.
                Button(albumStore.isInPlaylist(album: album) ? "Remove from Playlist" : "Add to Playlist",
                       systemImage: albumStore.isInPlaylist(album: album) ? "heart.fill" : "heart") {
                    alertIsShowing.toggle()
                }.buttonStyle(.borderedProminent)

            }
            Spacer()

        }.padding()
            .alert(albumStore.isInPlaylist(album: album) ?
                   "Do you want to remove \(album.collectionName) from your playlist?" :
                   "Do you want to add \(album.collectionName) to your playlist?",
                   isPresented: $alertIsShowing) {

                Button("Cancel", role: .cancel) {
                    //do nothing - the alert is dismissed
                }

                if albumStore.isInPlaylist(album: album) {
                    //red remove button - only shown when the album is in the playlist
                    Button(role: .destructive) {
                        albumStore.removeFromPlaylist(album: album)
                    } label: {
                        Text("Remove")
                    }
                } else {
                    //add button - only shown when the album is not in the playlist
                    Button("Add") {
                        albumStore.addToPlaylist(album: album)
                    }
                }
            }

    }
}

#Preview {
    NavigationStack {
        DetailView(album: Album.album, albumStore: AlbumStore.exampleAlbumStore)
    }
}
