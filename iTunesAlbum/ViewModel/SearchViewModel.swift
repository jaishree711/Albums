//
//  SearchViewModel.swift
//  iTunesAlbum
//
//  Created by 703177808 on 28/09/2020.
//  Copyright © 2020 703177808. All rights reserved.
//

import Foundation

//protocol SearchViewModelViewDelegate: class
//{
//    func searchButtonAction(viewModel: ListViewModel)
//}


class SearchViewModel {
    fileprivate var items: [Album]?
    var coordinatorDelegate: SearchViewModelCoordinatorDelegate?

    var album: Album?
    var model: AlbumListModel? {
        didSet {
            items = nil;
            model?.items({ (items) in
                self.items = items
            })
        }
    }

    func search() {
        if album?.artistName != "" && album?.trackName != "" {
                let dispatchGroup = DispatchGroup()
                let dispatchQueue = DispatchQueue(label: "forItems")

//                if let items = items, let  album=album {
                    dispatchGroup.enter()
                    model?.items({ (items) in
                        self.items = items
                        dispatchGroup.leave()
                    })
                    dispatchGroup.notify(queue: dispatchQueue){
                        DispatchQueue.main.async {
                            self.coordinatorDelegate?.searchButtonAction(result: self.items!, data: self.album!)
                        }
                    }
//                }
        }
    }
}
