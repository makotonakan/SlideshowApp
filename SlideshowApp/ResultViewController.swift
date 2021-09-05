//
//  ResultViewController.swift
//  SlideshowApp
//
//  Created by 中野誠 on 2021/09/02.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var imageview: UIImageView!
    
    var image: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        imageview.image = image
    }
}
