//
//  CatDetailsViewController.swift
//  cattico
//
//  Created by Abraham Sahid Reyes Rodriguez on 08/10/25.
//

import UIKit

class CatDetailsViewController: UIViewController {

    @IBOutlet weak var imgCat: UIImageView!
    @IBOutlet weak var txtName: UILabel!
    @IBOutlet weak var txtDescription: UILabel!
    
    var cat:Cat?
    
    private var presenter: CatsPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let cat = cat {
            print(cat)
            presenter = CatsPresenter()
            presenter?.catDetailsUI = self
            presenter?.catDetailsViewDidLoad(catId: cat.id)
            setImage(from: cat.url)
        }else{
            print("No cat")
        }
    }
    
    func setImage(from url: String) {
        guard let imageURL = URL(string: url) else { return }

        // just not to cause a deadlock in UI!
        DispatchQueue.global().async {
            guard let imageData = try? Data(contentsOf: imageURL) else { return }

            let image = UIImage(data: imageData)

            DispatchQueue.main.async {
                self.imgCat.image = image
            }
        }
    }
    
}

extension CatDetailsViewController: CatDetailsUI {
    func displayLoading() {
        
    }
    
    func displayCat(_ cat: CatBreed) {
        print(cat)
        DispatchQueue.main.async {
            self.txtName.text = cat.name
            self.txtDescription.text = cat.description
        }
    }
    
    func displayError(_ error: any Error) {
        print(error)
    }
    
    
}
