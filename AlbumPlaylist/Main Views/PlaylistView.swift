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
        Text("Playlist coming soon")
    }
}

#Preview {
    PlaylistView(albumStore: AlbumStore.exampleAlbumStore)
}
