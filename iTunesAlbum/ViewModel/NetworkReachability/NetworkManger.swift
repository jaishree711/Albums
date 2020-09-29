//
//  NetworkManger.swift
//  Albums
//
//  Created by 703177808 on 24/09/2020.
//  Copyright © 2020 703177808. All rights reserved.
//

import Foundation

class NetworkManager: NSObject {
    static func isNetworkAvailable() -> Bool {
        let reachability = Reachability()!
        if reachability.connection == .none {
            return false
        }
        return true
    }
}
