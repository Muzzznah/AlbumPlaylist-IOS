//
//  AlbumPlaylistApp.swift
//  AlbumPlaylist
//
//  Created by Muznah Adil on 2026-07-15.
//

import SwiftUI

@main
struct AlbumPlaylistApp: App {
    @State private var albumStore: AlbumStore = AlbumStore(albums: [])
    var body: some Scene {
        WindowGroup {
            TabView {
                Tab("Album Search", systemImage: "magnifyingglass") {
                    ContentView(albumStore: albumStore)
                }
                Tab("Playlist", systemImage: "music.note.list") {
                    PlaylistView(albumStore: albumStore)
                }
            }.onAppear() {
                albumStore.retrieveAlbums()
            }
        }
    }
}
