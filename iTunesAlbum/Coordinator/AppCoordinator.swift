//
//  AppCoordinator.swift
//  iTunesAlbum
//
//  Created by 703177808 on 28/09/2020.
//  Copyright © 2020 703177808. All rights reserved.
//

import UIKit

class AppCoordinator: Coordinator
{
    var navigation: UINavigationController

    init(navigation: UINavigationController){
        self.navigation = navigation
    }

    func start(){
        showSearch()
    }
}

extension AppCoordinator
{
    func showSearch()
    {
        let searchCoordinator = SearchCoordinator(navigation: navigation)
//        coordinators[LIST_KEY] = listCoordinator
//        listCoordinator.delegate = self
        searchCoordinator.start()
    }
}


