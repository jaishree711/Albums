//
//  CartViewController.swift
//  iTunesAlbum
//
//  Created by 703177808 on 29/09/2020.
//  Copyright © 2020 703177808. All rights reserved.
//

import UIKit

class CartViewController: UIViewController {
    var viewModel: CartViewModel?

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        tableView.reloadData()
    }
}
extension CartViewController: UITableViewDelegate, UITableViewDataSource {
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
        cell.accessoryType = .none
        return cell
    }
}
