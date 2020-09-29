//
//  SearchViewController.swift
//  Albums
//
//  Created by 703177808 on 24/09/2020.
//  Copyright © 2020 703177808. All rights reserved.
//

import UIKit



class SearchViewController: UIViewController,UITextFieldDelegate {
    @IBOutlet weak var artistNameField: UITextField!
    @IBOutlet weak var trackNameField: UITextField!
    @IBOutlet weak var releaseDate: UITextField!
    @IBOutlet weak var collectionPrice: UITextField!
    @IBOutlet weak var collectionName: UITextField!

    var viewModel: SearchViewModel?

    override func viewDidLoad() {
    }
    
    @IBAction func searchButtonAction(_ sender: Any) {
        artistNameField.endEditing(true)
        trackNameField.endEditing(true)
        collectionName.endEditing(true)
        collectionPrice.endEditing(true)

        viewModel?.search()
    }
    func textFieldDidEndEditing(_ textField: UITextField) {

        guard let text = textField.text else {
            return
        }
        switch textField {
        case artistNameField:
            viewModel?.album?.artistName = text
        case trackNameField:
            viewModel?.album?.trackName = text
        case collectionName:
            viewModel?.album?.collectionName = text
        case collectionPrice:
            viewModel?.album?.collectionPrice = Double(text) as! Double
        default:
            viewModel?.album?.trackName = text
        }
    }
}
