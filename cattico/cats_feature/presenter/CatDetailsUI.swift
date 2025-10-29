//
//  CatDetailsUI.swift
//  cattico
//
//  Created by Abraham Sahid Reyes Rodriguez on 28/10/25.
//

protocol CatDetailsUI : AnyObject {
    func displayLoading()
    func displayCat(_ cat:CatBreed)
    func displayError(_ error:Error)
}
