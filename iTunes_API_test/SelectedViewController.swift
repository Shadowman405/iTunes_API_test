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
        
        DispatchQueue.main.async { [weak self] in
            if let imageData = try? Data(contentsOf: url) {
                if let loadedImage = UIImage(data: imageData) {
                    self?.artworkImg.image = loadedImage
                }
            }
        }
    }

}
