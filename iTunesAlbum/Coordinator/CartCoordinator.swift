//
//  CartCoordinator.swift
//  iTunesAlbum
//
//  Created by 703177808 on 29/09/2020.
//  Copyright © 2020 703177808. All rights reserved.
//

import UIKit
class CartCoordinator: Coordinator {
    var navigation: UINavigationController
    var cartViewController: CartViewController?
//    weak var delegate: SortCoordinatorDelegate?
    var items: [Album]

    init(navigation: UINavigationController, items: [Album])
    {
        self.navigation = navigation
        self.items = items
    }

    func start() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
              cartViewController = storyboard.instantiateViewController(withIdentifier: "Cart") as? CartViewController

              guard let cartViewController = cartViewController else { return }

              let viewModel =  CartViewModel()
            viewModel.items = items
//              viewModel.coordinatorDelegate = self
              cartViewController.viewModel = viewModel
            navigation.pushViewController(cartViewController, animated: true)

        }

}
