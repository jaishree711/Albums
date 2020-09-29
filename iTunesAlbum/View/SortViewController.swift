//
//  SortViewController.swift
//  iTunesAlbum
//
//  Created by 703177808 on 28/09/2020.
//  Copyright © 2020 703177808. All rights reserved.
//

import UIKit

class SortViewController: UITableViewController {

    var viewModel: SortViewModel?
    

//    override func viewDidLoad() {
//
//    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
        viewModel?.selectRowAtIndexPath(indexPath: indexPath)
    }
}
