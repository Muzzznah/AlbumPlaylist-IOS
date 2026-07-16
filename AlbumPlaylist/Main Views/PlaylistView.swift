//
//  PlaylistView.swift
//  AlbumPlaylist
//
//  Created by Muznah Adil on 2026-07-15.
//

import Foundation
import SwiftUI

struct PlaylistView: View {

    var albumStore: AlbumStore

    var body: some View {
        List {
            ForEach(albumStore.albums, id: \.id) { album in
                VStack(alignment: .leading) {
                    // The album name.
                    Text(album.collectionName)
                        .font(.headline)
                    // The artist name.
                    Text(album.artistName)
                        .font(.subheadline)
                        .italic()
                }
            }.onDelete { indexSet in
                albumStore.removeFromPlaylist(atIndexSet: indexSet)
            }
        }
    }
}

#Preview {
    PlaylistView(albumStore: AlbumStore.exampleAlbumStore)
}
