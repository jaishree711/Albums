//
//  ConnectionHandlerProtocol.swift
//  Albums
//
//  Created by 703177808 on 24/09/2020.
//  Copyright © 2020 703177808. All rights reserved.
//

import Foundation

protocol  ConnectionHandlerProtocol: class {
    func didFinishRecievingData(inResponseData: NSDictionary)
    func didRecieveError(inResponseError: NSError)
}
