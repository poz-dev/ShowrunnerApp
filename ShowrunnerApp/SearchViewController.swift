//
//  SearchViewController.swift
//  ShowrunnerApp
//
//  Created by Kresimir Ivanjko on 22.04.2023..
//

import UIKit

class SearchViewController: UIViewController {

    @IBOutlet var searchShowLabel: UILabel!
    
    @IBOutlet var searchButton: UIButton!
    @IBOutlet var searchTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:)))
        tap.cancelsTouchesInView = false
        self.view.addGestureRecognizer(tap)
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var searchText = searchTextField.text!
        let destination = segue.destination as! ListViewController
        searchText = searchText.replacingOccurrences(of: " ", with: "%20")
        destination.searchText = searchText
    }
}
