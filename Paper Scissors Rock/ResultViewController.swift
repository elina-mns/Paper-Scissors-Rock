//
//  ResultViewController.swift
//  Paper Scissors Rock
//
//  Created by Elina Mansurova on 2020-08-31.
//  Copyright © 2020 Elina Mansurova. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet weak var playAgain: UIButton!
    @IBOutlet weak var picture: UIImageView!
    @IBOutlet weak var text: UILabel!
   
    
    var resultString = ""
    var image: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        text.text = resultString
        picture.image = image
    }
        
    @IBAction private func goBack() {
        dismiss(animated: true, completion: nil)
    }
}
