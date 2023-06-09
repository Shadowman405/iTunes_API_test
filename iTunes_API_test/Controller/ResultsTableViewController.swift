//
//  ResultsTableViewController.swift
//  iTunes_API_test
//
//  Created by Maxim Mitin on 6.05.23.
//

import UIKit

class ResultsTableViewController: UITableViewController, UISearchBarDelegate {
    
    private var responseResults = [Response.Result]()
    private let networkManager = NetworkManager.shared
    private var defaultURL = "https://itunes.apple.com/search?term=jack+johnson."
    let searchBar = UISearchBar()
 
    override func viewDidLoad() {
        super.viewDidLoad()

        networkManager.callAPI(url: "https://itunes.apple.com/search?term=jack+johnson.", with: { res in
            self.responseResults = res
            self.tableView.reloadData()
        })
        
        configureSearchBar()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return responseResults.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let result = responseResults[indexPath.row]
        var config = cell.defaultContentConfiguration()
        config.text = result.artistName
        config.secondaryText = result.trackName
        cell.contentConfiguration = config

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedArtist = responseResults[indexPath.row]
        performSegue(withIdentifier: "toDetails", sender: selectedArtist)
    }

}



extension ResultsTableViewController {
    //Segues    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is SelectedViewController {
            if let vc = segue.destination as? SelectedViewController {
                vc.selectedCell = (sender as? Response.Result)!
            }
            
        }
    }
    
    //SearchBar
    func configureSearchBar() {
        searchBar.searchBarStyle = .prominent
        searchBar.placeholder = "Search...."
        searchBar.sizeToFit()
        searchBar.isTranslucent = false
        searchBar.backgroundImage = UIImage()
        searchBar.delegate = self
        tableView.addSubview(searchBar)
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print(searchText)
        
        networkManager.callAPI(url: "https://itunes.apple.com/search?term=\(searchText)") { res in
                self.responseResults = res
                self.tableView.reloadData()
        }
    }
}
