//
//  ContentView.swift
//  AlbumPlaylist
//
//  Created by Muznah Adil on 2026-07-15.
//

import SwiftUI

struct ContentView: View {
    // The albums returned from the search.
    @State private var albums: [Album] = []

    // The text typed into the search bar.
    @State private var searchText = ""

    var body: some View {
        
        // Enable Navigation
        NavigationStack {

            List {
                ForEach(albums, id: \.id) { album in
                    Text(album.collectionName)
                }
            }
            .navigationTitle("Muznah's Albums")
            .searchable(text: $searchText, prompt: "Search for an album or artist")
            .onSubmit(of: .search) {
                loadData(forSearchTerm: searchText)
            }

        }
    }

    // Load from the api
    func loadData(forSearchTerm searchTerm: String) {
        Task {
            
            // Percent encode anything that is not allowed in a URL
            guard let cleanText = searchTerm.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) else {
                return
            }

            let urlString = "https://itunes.apple.com/search?term=\(cleanText)&entity=album"

            print(urlString)

            guard let url = URL(string: urlString) else {
                return
            }

            do {
                let (data, _) = try await URLSession.shared.data(from: url)

                let jsonDecoder = JSONDecoder()
                let results = try jsonDecoder.decode(Albums.self, from: data)

                albums = results.results

            } catch {
                print("Can't load data")
            }
        }
    }
}

#Preview {
    ContentView()
}
