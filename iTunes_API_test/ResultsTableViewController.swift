//
//  ResultsTableViewController.swift
//  iTunes_API_test
//
//  Created by Maxim Mitin on 6.05.23.
//

import UIKit

class ResultsTableViewController: UITableViewController {
    
    private var responseResults = [Response.Result]()
 
    override func viewDidLoad() {
        super.viewDidLoad()

        callAPI()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
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
    func callAPI() {
        guard let url = URL(string: "https://itunes.apple.com/search?term=jack+johnson.") else {return}
        
            let task = URLSession.shared.dataTask(with: url) { data, response, error in
                let decoder = JSONDecoder()
                
                if let data = data {
                    do {
                        let results = try decoder.decode(Response.self, from: data)
                        //print(results)
                        for result in results.results {
                            self.responseResults.append(result)
                            //print(result)
                            
                            DispatchQueue.main.async {
                                self.tableView.reloadData()
                            }
                        }
                    } catch {
                        print(error)
                    }
                }
            }
            task.resume()
    }
    
    
    //Segues
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is SelectedViewController {
            if let vc = segue.destination as? SelectedViewController {
                vc.selectedCell = (sender as? Response.Result)!
            }
            
        }
    }
}
