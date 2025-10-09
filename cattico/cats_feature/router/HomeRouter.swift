//
//  HomeRouter.swift
//  cattico
//
//  Created by Abraham Sahid Reyes Rodriguez on 09/10/25.
//

import UIKit


protocol HomeRouterProtocol:AnyObject{
    func navigateToCatsDetail()
    func navigateToCatImage()
}

class HomeRouter:HomeRouterProtocol {
    weak var viewController:UIViewController?
    
    func navigateToCatsDetail() {
        
    }
    
    func navigateToCatImage() {
        
    }
    
    
}
