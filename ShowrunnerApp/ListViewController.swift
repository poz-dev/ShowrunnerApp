//
//  ListViewController.swift
//  ShowrunnerApp
//
//  Created by Kresimir Ivanjko on 18.04.2023..
//

import UIKit

class ListViewController: UIViewController {

    @IBOutlet var segmentedControl: UISegmentedControl!
    @IBOutlet var tableView: UITableView!
    
    var shows = Shows()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        shows.getData {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }


    @IBAction func segmentPressed(_ sender: UISegmentedControl) {
    }
}

extension ListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shows.showArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = shows.showArray[indexPath.row].show.name
        if let rating = shows.showArray[indexPath.row].show.rating?.average {
            cell.detailTextLabel?.text = "\(rating)"
        } else {
            cell.detailTextLabel?.text = "-"

        }
        return cell
    }
    
    
}
