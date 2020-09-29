//
//  AlbumListViewController.swift
//  iTunesAlbum
//
//  Created by 703177808 on 28/09/2020.
//  Copyright © 2020 703177808. All rights reserved.
//

import UIKit

class AlbumListViewController: UIViewController {

    var viewModel: AlbumListViewModel? {
        willSet {
            viewModel?.viewDelegate = nil
        }
        didSet {
            viewModel?.viewDelegate = self
        }
    }

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchButton: UIButton!

    override func viewDidLoad() {
        viewModel?.searchForItem()
    }

    @IBAction func addToCartButtonAction(_ sender: Any) {
        viewModel?.addToCartAction()
    }

    @IBAction func clearSearchButtonAction(_ sender: Any) {
        if searchButton.titleLabel?.text == "Clear Search" {
            searchButton.setTitle("Search", for: .normal)
            viewModel?.clearSearch()
        } else {
            viewModel?.gotoSearch()
        }
    }
    @IBAction func sortButtonAction(_ sender: Any) {
        viewModel?.sortButtonAction()
    }
}

extension AlbumListViewController: ListViewModelViewDelegate {
    func itemsDidChange(){
        tableView.reloadData()
    }
}

extension AlbumListViewController: UITableViewDelegate, UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let viewModel = viewModel {
            return viewModel.numberOfItems
        }

        return 0
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 170
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell", for: indexPath) as! AlbumCell
        let item = viewModel?.itemAtIndex((indexPath as NSIndexPath).row)
        cell.item = item
        if ((viewModel?.containsItem(item!))!){
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
        return cell

    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        viewModel?.itemSelected((indexPath as NSIndexPath).row)
    }

    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        tableView.cellForRow(at: indexPath)?.accessoryType = .none
        viewModel?.itemDeselected((indexPath as NSIndexPath).row)

    }


}
