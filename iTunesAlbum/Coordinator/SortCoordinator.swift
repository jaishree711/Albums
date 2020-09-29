//
//  SortCoordinator.swift
//  iTunesAlbum
//
//  Created by 703177808 on 28/09/2020.
//  Copyright © 2020 703177808. All rights reserved.
//

import UIKit

protocol SortViewModelCoordinatorDelegate: class
{
    func  didSelectRowForSort(sortValue: SortValue)
//    func listViewModelDidSelectData(_ viewModel: ListViewModel, data: DataItem)
}

protocol SortCoordinatorDelegate: class
{
    func sortingSelectionFinish(sortValue: SortValue)
}

class SortCoordinator: Coordinator {
    var navigation: UINavigationController
    var sortViewController: SortViewController?
    weak var delegate: SortCoordinatorDelegate?

    init(navigation: UINavigationController)
    {
        self.navigation = navigation
    }

    func start() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
              sortViewController = storyboard.instantiateViewController(withIdentifier: "Sort") as? SortViewController

              guard let sortViewController = sortViewController else { return }

              let viewModel =  SortViewModel()
//                viewModel.album = dataItem
//                viewModel.items = result
    //          viewModel.album = Album()
              viewModel.coordinatorDelegate = self
              sortViewController.viewModel = viewModel
            navigation.pushViewController(sortViewController, animated: true)

        }

}
extension SortCoordinator: SortViewModelCoordinatorDelegate {
    func didSelectRowForSort(sortValue: SortValue) {
        delegate?.sortingSelectionFinish(sortValue: sortValue)
    }


}
