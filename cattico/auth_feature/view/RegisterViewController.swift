//
//  RegisterViewController.swift
//  cattico
//
//  Created by Abraham Sahid Reyes Rodriguez on 09/10/25.
//

import UIKit

class RegisterViewController: UIViewController {
    
    private var presenter:AuthPresenter?

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = AuthPresenter()
        presenter?.registerViewDidLoad()
    }

}

extension RegisterViewController: RegisterUI {
    func displayLoading() {
        print("Loading Register")
    }
    
    func successRegister() {
        print("successRegister")

    }
    
    func showError(message: String) {
        print("showError")
    }
    
    
}
