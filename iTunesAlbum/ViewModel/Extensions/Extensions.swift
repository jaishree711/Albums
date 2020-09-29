//
//  Extensions.swift
//  iTunesAlbum
//
//  Created by 703177808 on 29/09/2020.
//  Copyright © 2020 703177808. All rights reserved.
//

import UIKit

extension Array {

    func uniques<T: Hashable>(by keyPath: KeyPath<Element, T>) -> [Element] {
        return reduce([]) { result, element in
            let alreadyExists = (result.contains(where: { $0[keyPath: keyPath] == element[keyPath: keyPath] }))
            return alreadyExists ? result : result + [element]
        }
    }
}

extension Date
{
    func toString( dateFormat format  : String ) -> String
    {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self)
    }
}

enum SortValue: NSInteger {
    case trackName = 0
    case artistName
    case collectionName
    case collectionPrice
    case releaseDate
}

