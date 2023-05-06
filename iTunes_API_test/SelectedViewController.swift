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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureView()
    }
    
    func configureView() {
        artistLbl.text = selectedCell.artistName
        trackLbl.text = selectedCell.trackName
    }

}
