//
//  SortViewModel.swift
//  iTunesAlbum
//
//  Created by 703177808 on 28/09/2020.
//  Copyright © 2020 703177808. All rights reserved.
//

import Foundation

class SortViewModel {
    var coordinatorDelegate: SortViewModelCoordinatorDelegate?

    func selectRowAtIndexPath(indexPath: IndexPath) {
        let sortValue = indexPath.row
        if let sortValue = SortValue(rawValue: sortValue) {
            coordinatorDelegate?.didSelectRowForSort(sortValue: sortValue)
        }
    }
}
