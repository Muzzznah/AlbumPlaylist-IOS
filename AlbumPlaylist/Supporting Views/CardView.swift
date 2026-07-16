//
//  CardView.swift
//  AlbumPlaylist
//
//  Created by Muznah Adil on 2026-07-15.
//

import Foundation
import SwiftUI

struct CardView: View {
    var album: Album

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 5)
                .fill(.card)

            VStack {
                // The artwork url is optional - show a placeholder if it is missing
                if let artworkUrl = album.artworkUrl100 {
                    AsyncImage(url: URL(string: artworkUrl)) { result in
                        if let image = result.image {
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 80, height: 80)
                        } else if result.error != nil {
                            Image(systemName: "photo")
                        } else {
                            ProgressView()
                        }
                    }
                } else {
                    Image(systemName: "photo")
                        .font(.largeTitle)
                        .foregroundStyle(.white)
                }

                Divider()

                Text(album.artistName)
                    .bold()
                    .lineLimit(2)
                    .font(.caption)
                    .foregroundStyle(.white)

            }.padding()
        }
    }
}

#Preview {
    CardView(album: Album.album)
}
