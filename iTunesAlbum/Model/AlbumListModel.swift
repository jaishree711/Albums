//
//  AlbumListModel.swift
//  iTunesAlbum
//
//  Created by 703177808 on 28/09/2020.
//  Copyright © 2020 703177808. All rights reserved.
//

import Foundation

protocol ListModel
{
    func items(_ completionHandler: @escaping (_ items: [Album]) -> Void)
}


class AlbumListModel: ListModel, SearchManagerProtocol
{
    fileprivate var items = [Album]()

    func fetchAlbums() {
        let searchManager = SearchManager()
        searchManager.searchMangerDelegate = self
        searchManager.sendRequestToFetchResults()
    }

    init() {
        fetchAlbums()
    }

    func didRecieveResults(result: [Album]) {
        let newResult = result.uniques(by: \.trackName)
        items = newResult
        print(items)
    }

    func items(_ completionHandler: @escaping (_ items: [Album]) -> Void)
    {
        // Simulate Aysnchronous data access
        DispatchQueue.global().async {
            completionHandler(self.items)
        }
    }
}

