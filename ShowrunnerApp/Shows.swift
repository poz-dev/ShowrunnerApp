//
//  Shows.swift
//  ShowrunnerApp
//
//  Created by Kresimir Ivanjko on 18.04.2023..
//

import Foundation

class Shows {
    struct Returned: Codable {
        var show: Show
    }
    
    var urlString = "https://api.tvmaze.com/search/shows?q="
    var showArray: [Returned] = []
    
    // MARK: - Get data function
    
    func getData(completed: @escaping () -> ()) {
        print("Accesing url")
        
    // MARK: - Create URL
        
        guard let url = URL(string: urlString) else {
            print("Error: Could not create URL from String")
            completed()
            return
        }
        
    // MARK: - Create URLSession
        
        let session = URLSession.shared
        
    // MARK: - Get data with .dataTask method
        
        let task = session.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print("Error: \(error.localizedDescription)")
            }
            do {
                self.showArray = try JSONDecoder().decode([Returned].self, from: data!)
                    print("Returned: \(self.showArray)")
                
            } catch {
                print("JSON error")
            }
            completed()
        }
        task.resume()
    }
    
}
