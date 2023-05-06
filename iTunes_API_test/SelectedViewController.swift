//
//  SelectedViewController.swift
//  iTunes_API_test
//
//  Created by Maxim Mitin on 6.05.23.
//

import UIKit

class SelectedViewController: UIViewController {
    
    var selectedCell = Response.Result()
    
    @IBOutlet weak var artistLbl: UILabel!
    @IBOutlet weak var trackLbl: UILabel!
    @IBOutlet weak var artworkImg: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureView()
    }
    
    func configureView() {
        artistLbl.text = selectedCell.artistName
        trackLbl.text = selectedCell.trackName
        
        guard let url = URL(string: selectedCell.artworkUrl100) else { return }
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let imageData = data else {return}
            
            DispatchQueue.main.async {
                let loadedImg = UIImage(data: imageData)
                self.artworkImg.image = loadedImg
            }
        }
        .resume()
    }

}
