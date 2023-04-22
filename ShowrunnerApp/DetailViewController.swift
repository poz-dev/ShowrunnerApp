//
//  DetailViewController.swift
//  ShowrunnerApp
//
//  Created by Kresimir Ivanjko on 22.04.2023..
//

import UIKit

class DetailViewController: UIViewController {
    

    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var ratingLabel: UILabel!
    @IBOutlet var networkLabel: UILabel!
    @IBOutlet var genresLabel: UILabel!
    @IBOutlet var languageLabel: UILabel!
    @IBOutlet var textfieldLabel: UITextView!
    @IBOutlet var imageView: UIImageView!
    
    var show: Show!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard show != nil else {
            return
        }
        
        updateUserInterface()
    }
    func updateUserInterface() {
        nameLabel.text = show.name
        languageLabel.text = show.language ?? ""
        show.summary = show.summary?.replacingOccurrences(of: "<[^>]+>", with: "",
    options: .regularExpression, range: nil)
        textfieldLabel.text = show.summary ?? ""
        networkLabel.text = show.network?.name ?? ""
        if let rating = show.rating?.average {
            ratingLabel.text = "\(rating)"
        } else {
           ratingLabel?.text = "-"
        }
        var genreList = ""
        if show.genres != nil {
            for genre in show.genres! {
                genreList += "\(genre)\n"
            }
            if genreList != "" {
                genreList.removeLast()
            }
        }
        genresLabel.text = genreList
        guard let url = URL(string: show.image?.original ?? "") else { return }
        do {
            let data = try Data(contentsOf: url)
            imageView.image = UIImage(data: data)
        } catch {
            print("Error")
        }
        
    }
}
