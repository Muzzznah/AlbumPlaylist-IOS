//
//  AlbumPlaylistApp.swift
//  AlbumPlaylist
//
//  Created by Muznah Adil on 2026-07-15.
//

import SwiftUI

@main
struct AlbumPlaylistApp: App {

    var body: some Scene {
        WindowGroup {
            TabView {
                Tab("Album Search", systemImage: "magnifyingglass") {
                    ContentView()
                }
                Tab("Playlist", systemImage: "music.note.list") {
                    PlaylistView()
                }
            }
        }
    }
}
