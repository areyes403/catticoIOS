//
//  LoginViewController.swift
//  cattico
//
//  Created by Abraham Sahid Reyes Rodriguez on 08/10/25.
//

import UIKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func btnSignInAction(_ sender: Any) {
        let next = storyboard?.instantiateViewController(withIdentifier: "TabBarController") as! UITabBarController
        navigationController?.pushViewController(next, animated: true)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
