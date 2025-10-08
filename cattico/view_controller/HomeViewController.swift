//
//  ViewController.swift
//  cattico
//
//  Created by Abraham Sahid Reyes Rodriguez on 02/10/25.
//

import UIKit

class HomeViewController: UIViewController {
    
    let repository:Repository = RepositoryImpl.instance
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func onClick(_ sender: Any) {

        
//         Task{
//             do{
//                 let cats: [Cat] = try await self.repository.getCats()
//                 print(cats)
//             }catch let error as NetworkingError {
//                 switch error {
//                 case .encodingFailed(let inner):
//                     print("Encoding error: \(inner)")
//                 case .decodingFailed(let inner):
//                     print("Decoding error: \(inner)")
//                 case .invalidStatusCode(let code):
//                     print("Invalid status code: \(code)")
//                 case .requestFailed(let inner):
//                     print("Request failed: \(inner)")
//                 case .otherError(let inner):
//                     print("Other error: \(inner)")
//                 }
//             } catch {
//                 print("Unexpected error: \(error)")
//             }
//         }
         
    }


}

