//
//  AlbumListViewModel.swift
//  iTunesAlbum
//
//  Created by 703177808 on 28/09/2020.
//  Copyright © 2020 703177808. All rights reserved.
//

import Foundation

protocol ListViewModelViewDelegate: class
{
    func itemsDidChange()
}

class AlbumListViewModel {
    var sortValue:SortValue? {
        didSet {
            switch  sortValue{
            case .artistName:
                items?.sort(by:{ $0.artistName < $1.artistName})
            case .trackName:
                items?.sort(by:{ $0.trackName < $1.trackName})
            case .collectionName:
                items?.sort(by:{ $0.collectionName < $1.collectionName})
            case .releaseDate:
                items?.sort(by:{ $0.releaseDate.compare($1.releaseDate) == .orderedAscending })
            default:
                items?.sort(by:{ $0.collectionPrice > $1.collectionPrice})

            }
        }
    }
    var album: Album?
    var selectedAlbums: [Album]?
    var coordinatorDelegate: ListViewModelCoordinatorDelegate?

     weak var viewDelegate: ListViewModelViewDelegate?

    var items: [Album]? {
        didSet {
            viewDelegate?.itemsDidChange()
        }
    }

    func searchForItem() {
        var list = [Album]()
        if let items=items ,let album = album {
            list = items.filter{ $0.artistName.localizedCaseInsensitiveContains(album.artistName) && $0.trackName.localizedCaseInsensitiveContains(album.trackName)}

            if album.collectionName != "" {
                list = list.filter{$0.collectionName == album.collectionName}
            }
            if album.collectionPrice != 0.0 {
                list = list.filter{$0.collectionPrice == album.collectionPrice}
            }
        }
        items = list
    }

    func clearSearch() {
        items = nil
        items = coordinatorDelegate?.getAllResults()
        sortValue = .releaseDate
    }

    func gotoSearch() {
        coordinatorDelegate?.backToSearch()
    }

    func sortButtonAction() {
        coordinatorDelegate?.sortButtonAction()
    }
    func addToCartAction() {
        if let selectedAlbums = selectedAlbums, selectedAlbums.count>0 {
            coordinatorDelegate?.moveToCartButtonAction(selectedAlbums)
        }
    }
    func itemSelected(_ index: Int) {
        if let items = items , items.count > index {
            selectedAlbums?.append(items[index])
        }
    }

    func itemDeselected(_ index: Int) {
        if let items = items , items.count > index, var selectedAlbums = selectedAlbums {
            if let itemToRemoveIndex = selectedAlbums.firstIndex(of: items[index]) {
                selectedAlbums.remove(at: itemToRemoveIndex)
                self.selectedAlbums = selectedAlbums
            }
        }
    }
    func containsItem(_ item: Album) -> Bool {
        if let value = selectedAlbums?.contains(item) {
            return value
        }
        return false
    }

    var numberOfItems: Int {
        if let items = items {
            return items.count
        }
        return 0
    }

    func itemAtIndex(_ index: Int) -> Album?
    {
        if let items = items , items.count > index {
            return items[index]
        }
        return nil
    }
}
