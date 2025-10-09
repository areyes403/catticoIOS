//
//  ViewController.swift
//  cattico
//
//  Created by Abraham Sahid Reyes Rodriguez on 02/10/25.
//

import UIKit


class HomeViewController: UIViewController {
    
    var presenter:CatsPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("HomeViewController...")
        presenter=CatsPresenter()
        presenter?.homeUI = self
        presenter?.homeViewDidLoad()
    }


}

extension HomeViewController : HomeUI {
    func displayLoading() {
        print("Loading...")
    }
    
    func displayError(_ error: any Error) {
        print("\(error)")
    }
    
    func displayCats(_ cats: [Cat]) {
        print(cats)
    }
    
    
}

