//
//  SearchManager.swift
//  Albums
//
//  Created by 703177808 on 24/09/2020.
//  Copyright © 2020 703177808. All rights reserved.
//

import Foundation

protocol SearchManagerProtocol: class {
    func didRecieveResults(result:[Album])
}

class SearchManager: ConnectionHandlerProtocol {
    let connectionHandler = ConnectionHandler.shared
    weak var searchMangerDelegate: SearchManagerProtocol?

    func sendRequestToFetchResults() {
        print("inside sendRequestToFetchResults")

        connectionHandler.connectionHandlerDelegate = self
        connectionHandler.processRequest()
    }

    func didFinishRecievingData(inResponseData: NSDictionary) {
        print("inside didFinishRecievingData")

        let albums = updateAlbums(data: inResponseData)
        searchMangerDelegate?.didRecieveResults(result: albums)
    }

    func didRecieveError(inResponseError: NSError) {

    }

    func updateAlbums(data: NSDictionary) -> [Album] {
        var albums = [Album]()
        guard let results = data.value(forKey: "results") as? [Any] else { return albums }
        for result in results {
            var album = Album()
            if let theartistName = (result as AnyObject).value(forKey:"artistName") as? String {
                album.artistName = theartistName
            }
            if let thetrackName = (result as AnyObject).value(forKey:"trackName") as? String {
                album.trackName = thetrackName
            }
            if let theCollectionName = (result as AnyObject).value(forKey:"collectionName") as? String {
                album.collectionName = theCollectionName
            }
            if let theCollectionName = (result as AnyObject).value(forKey:"collectionName") as? String {
                album.collectionName = theCollectionName
            }
            if let theCollectionPrice = (result as AnyObject).value(forKey:"collectionPrice") as? Double {
                album.collectionPrice = theCollectionPrice
            }
            if let theArtworkUrl = (result as AnyObject).value(forKey:"artworkUrl100") as? String {
                album.artworkURL = theArtworkUrl
            }
            if let theReleaseDate = (result as AnyObject).value(forKey:"releaseDate") as? String {
                album.releaseDate = self.convertStringToDate(dateStr: theReleaseDate)
            }
            albums.append(album)
        }
        return albums
    }

    func convertStringToDate(dateStr: String) -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy'-'MM'-'dd'T'HH':'mm':'ssZZZ"
        guard let date = dateFormatter.date(from: dateStr) else { return Date() }
        return date
    }

}
