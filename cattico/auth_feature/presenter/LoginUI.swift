//
//  LognUI.swift
//  cattico
//
//  Created by Abraham Sahid Reyes Rodriguez on 09/10/25.
//

protocol LoginUI:AnyObject{
    func displayLoading()
    func successLogin()
    func showError(message:String)
}
