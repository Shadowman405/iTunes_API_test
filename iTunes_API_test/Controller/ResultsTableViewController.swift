//
//  ResultsTableViewController.swift
//  iTunes_API_test
//
//  Created by Maxim Mitin on 6.05.23.
//

import UIKit

class ResultsTableViewController: UITableViewController {
    
    private var responseResults = [Response.Result]()
    private let networkManager = NetworkManager.shared
 
    override func viewDidLoad() {
        super.viewDidLoad()

        networkManager.callAPI(with: { res in
            self.responseResults = res
            self.tableView.reloadData()
        })
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
}
