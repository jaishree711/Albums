//
//  Album.swift
//  Albums
//
//  Created by 703177808 on 24/09/2020.
//  Copyright © 2020 703177808. All rights reserved.
//

import Foundation

struct Album:Equatable {
    var artistName: String = ""
    var trackName: String = ""
    var collectionName: String = ""
    var collectionPrice: Double = 0.0
    var releaseDate: Date = Date()
    var artworkURL: String = ""

//    init(artistName: String, trackName: String){
//        self.artistName
//    }
}
