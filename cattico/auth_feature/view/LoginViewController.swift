//
//  LoginViewController.swift
//  cattico
//
//  Created by Abraham Sahid Reyes Rodriguez on 08/10/25.
//

import UIKit

class LoginViewController: UIViewController {
    
    private var presenter:AuthPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = AuthPresenter()
        presenter?.loginUI = self
        presenter?.loginViewDidLoad()
    }
    

    @IBAction func btnSignInAction(_ sender: Any) {
        presenter?.login(email: "", password: "")
    }

}

extension LoginViewController:LoginUI {
    func displayLoading() {

    }
    
    func successLogin() {
        print("success")
        DispatchQueue.main.async {
            if let window = self.view.window {
                let next = self.storyboard?.instantiateViewController(withIdentifier: "TabBarController") as! UITabBarController

                UIView.transition(
                    with: window,
                    duration: 0.5,
                    options: [.transitionCrossDissolve], // Puedes cambiar el tipo de animación
                    animations: {
                        window.rootViewController = next
                    },
                    completion: nil
                )
            }
        }
    }
    
    func showError(message: String) {
        
    }
    
}
