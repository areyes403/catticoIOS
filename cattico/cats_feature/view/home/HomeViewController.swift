//
//  ViewController.swift
//  cattico
//
//  Created by Abraham Sahid Reyes Rodriguez on 02/10/25.
//

import UIKit


class HomeViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var presenter:CatsPresenter?
    
    var cats:[Cat] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("HomeViewController...")
        presenter=CatsPresenter()
        presenter?.homeUI = self
        presenter?.homeViewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
    }

    @IBOutlet weak var cview: UICollectionView!
    
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
        self.cats = cats
        
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }

    }
    
}

extension HomeViewController:
    UICollectionViewDataSource,
        UICollectionViewDelegate,
    UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //return apps.count
        return cats.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cat = cats[indexPath.item]
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CatViewCell", for: indexPath) as! CollectionViewCell
        

        if let url = URL(string: cat.url) {
            URLSession.shared.dataTask(with: url) { data, _, _ in
                if let data = data, let image = UIImage(data: data) {
                    DispatchQueue.main.async() { [weak cell] in
                        cell?.imgCat.image = image
                    }
                }
            }.resume()
        }
        
        return cell
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cat = cats[indexPath.item]
        let width: CGFloat = 150
        let aspectRatio = CGFloat(cat.height) / CGFloat(cat.height)
        let height = width * aspectRatio
        
        return CGSize(width: width, height: height)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedCat = cats[indexPath.item]
        print("Seleccionaste el gato: \(selectedCat)")
        performSegue(withIdentifier: "navHomeToDetails", sender: self)
    }



    
}

