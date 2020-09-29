//
//  SearchCoordinator.swift
//  iTunesAlbum
//
//  Created by 703177808 on 28/09/2020.
//  Copyright © 2020 703177808. All rights reserved.
//
import UIKit
protocol SearchViewModelCoordinatorDelegate: class
{
    func  searchButtonAction(result: [Album], data: Album)
}

class SearchCoordinator: Coordinator
{
    init(navigation: UINavigationController)
    {
        self.navigation = navigation
    }

//    weak var delegate: ListCoordinatorDelegate?
 //   var detailCoordinator: DetailCoordinator?
    var navigation: UINavigationController
    var searchViewController: SearchViewController?
    var listCoordinator: ListCoordinator?
    func start()
    {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        searchViewController = storyboard.instantiateViewController(withIdentifier: "Search") as? SearchViewController

        guard let searchViewController = searchViewController else { return }

        let viewModel =  SearchViewModel()
        viewModel.model = AlbumListModel()
        viewModel.album = Album()
        viewModel.coordinatorDelegate = self
        searchViewController.viewModel = viewModel
        navigation.pushViewController(searchViewController, animated: true)
    }
}
extension SearchCoordinator: SearchViewModelCoordinatorDelegate
{
    func searchButtonAction(result: [Album], data: Album)
    {
        listCoordinator = ListCoordinator(navigation: navigation, dataItem: data, result: result)
        listCoordinator?.start()
    }
}

