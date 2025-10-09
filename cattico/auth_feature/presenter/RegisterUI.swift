//
//  RegisterUI.swift
//  cattico
//
//  Created by Abraham Sahid Reyes Rodriguez on 09/10/25.
//

protocol RegisterUI:AnyObject {
    func displayLoading()
    func successRegister()
    func showError(message:String)
}
