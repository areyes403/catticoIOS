//
//  HomeUI.swift
//  cattico
//
//  Created by Abraham Sahid Reyes Rodriguez on 09/10/25.
//

protocol HomeUI : AnyObject {
    func displayLoading()
    func displayCats(_ cats:[Cat])
    func displayError(_ error:Error)
}
