//
//  ListCoordinator.swift
//  iTunesAlbum
//
//  Created by 703177808 on 28/09/2020.
//  Copyright © 2020 703177808. All rights reserved.
//

import UIKit
protocol ListViewModelCoordinatorDelegate: class
{
    func getAllResults() -> [Album]
    func backToSearch()
    func sortButtonAction()
    func moveToCartButtonAction(_ selectedItems: [Album])
}

class ListCoordinator: Coordinator {
    var navigation: UINavigationController
    var listViewController: AlbumListViewController?
    var sortCoordinator: SortCoordinator?
    var cartCoordinator: CartCoordinator?
    let dataItem: Album
    let result: [Album]
    init(navigation: UINavigationController, dataItem: Album, result: [Album])
    {
        self.navigation = navigation
        self.dataItem = dataItem
        self.result = result
    }

    func start() {
          let storyboard = UIStoryboard(name: "Main", bundle: nil)
          listViewController = storyboard.instantiateViewController(withIdentifier: "List") as? AlbumListViewController

          guard let listViewController = listViewController else { return }

          let viewModel =  AlbumListViewModel()
            viewModel.album = dataItem
            viewModel.items = result
            viewModel.sortValue = .releaseDate
            viewModel.selectedAlbums = [Album]()
            viewModel.coordinatorDelegate = self
          listViewController.viewModel = viewModel
        navigation.pushViewController(listViewController, animated: true)
    }
}

extension ListCoordinator: ListViewModelCoordinatorDelegate {

    func getAllResults() -> [Album] {
        return self.result
    }
    func backToSearch(){
        navigation.popViewController(animated: true)
    }
    func sortButtonAction() {
        sortCoordinator = SortCoordinator(navigation: navigation)
        sortCoordinator?.delegate = self
        sortCoordinator?.start()
    }
    func moveToCartButtonAction(_ selectedItems: [Album]) {
        cartCoordinator = CartCoordinator(navigation: navigation, items: selectedItems)
        cartCoordinator?.start()
    }

}

extension ListCoordinator: SortCoordinatorDelegate {
    func sortingSelectionFinish(sortValue: SortValue) {
        guard let listViewController = listViewController else { return }
        print(sortValue)
        listViewController.viewModel?.sortValue = sortValue
        navigation.popViewController(animated: true)
    }
}
