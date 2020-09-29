//
//  CartViewModel.swift
//  iTunesAlbum
//
//  Created by 703177808 on 29/09/2020.
//  Copyright © 2020 703177808. All rights reserved.
//

import Foundation
class CartViewModel {
    var items: [Album]?
    
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
