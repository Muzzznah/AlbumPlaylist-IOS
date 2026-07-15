//
//  AlbumStore.swift
//  AlbumPlaylist
//
//  Created by Muznah Adil on 2026-07-15.
//

import Foundation
import Observation
import SwiftUI

@Observable
class AlbumStore {
    
    // A sample store used by the previews (same idea as Campstore.exampleCampstore).
    static let exampleAlbumStore = AlbumStore(albums: [Album.album])
    
    var albums: [Album]
    
    init(albums: [Album]) {
        self.albums = albums
    }
    
    //return whether the album is already in the playlist
    func isInPlaylist(album: Album) -> Bool {
        albums.contains(album) ? true : false
    }
    
    //add to the playlist and save
    func addToPlaylist(album: Album) {
        if isInPlaylist(album: album) {
            return
        } else {
            albums.append(album)
            saveAlbums()
        }
    }
    
    //remove from the playlist when swiping a row in the list
    func removeFromPlaylist(atIndexSet indexSet: IndexSet) {
        albums.remove(atOffsets: indexSet)
        saveAlbums()
    }
    
    //remove from the playlist when clicking the button
    func removeFromPlaylist(album: Album) {
        for (index, existingAlbum) in albums.enumerated() {
            if album.id == existingAlbum.id {
                albums.remove(at: index)
                saveAlbums()
                return
            }
        }
    }
    
    //find where the items are stored on the device
    var documentDirectory: URL? {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
    //save to the device
    func saveAlbums() {
        guard let docDirectory = documentDirectory else { return }
        let saveLocation = docDirectory.appendingPathComponent("playlist.json")
        do {
            let jsonEncoder = JSONEncoder()
            //makes it readable for us
            jsonEncoder.outputFormatting = .prettyPrinted
            
            let saveData = try jsonEncoder.encode(albums)
            
            try saveData.write(to: saveLocation)
            
        } catch {
            print("Error - cannot save data. \(error.localizedDescription)")
        }
    }
    
    //get from the device
    func retrieveAlbums() {
        guard let documentDirectory = documentDirectory else { return }
        let fileLocation = documentDirectory.appendingPathComponent("playlist.json")
        print(fileLocation)
        do {
            let jsonDecoder = JSONDecoder()
            let fetchedData = try Data(contentsOf: fileLocation)
            albums = try jsonDecoder.decode([Album].self, from: fetchedData)
            
        } catch {
            print("Error - cannot retrieve stored data. \(error.localizedDescription)")
        }
    }
}
