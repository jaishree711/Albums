//
//  AlbumCell.swift
//  iTunesAlbum
//
//  Created by 703177808 on 28/09/2020.
//  Copyright © 2020 703177808. All rights reserved.
//

import UIKit

class AlbumCell: UITableViewCell {
    @IBOutlet weak var artistName: UILabel!
    @IBOutlet weak var trackName: UILabel!
    @IBOutlet weak var collectionName: UILabel!
    @IBOutlet weak var collectionPrice: UILabel!
    @IBOutlet weak var releaseDate: UILabel!
    @IBOutlet weak var artwork: UITextView!

    var item: Album? {
        didSet {
            if let item = item {
                artistName.text = item.artistName
                trackName.text = item.trackName
                collectionName.text = item.collectionName
                releaseDate.text = item.releaseDate.toString(dateFormat: "dd/MM/YYYY")
                collectionPrice.text = "$" + String(format: "%.2f", item.collectionPrice)
                artwork.text = item.artworkURL
            } else {
                artistName.text = "Unknown"
                trackName.text = "Unknown"
                collectionName.text = "Unknown"
                collectionPrice.text = "0.0"
            }
        }
    }

}
