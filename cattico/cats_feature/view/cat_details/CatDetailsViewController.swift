//
//  CatDetailsViewController.swift
//  cattico
//
//  Created by Abraham Sahid Reyes Rodriguez on 08/10/25.
//

import UIKit

class CatDetailsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func goToImage(_ sender: Any) {
        performSegue(withIdentifier: "navDetailsToImage", sender: nil)
    }
    

}
