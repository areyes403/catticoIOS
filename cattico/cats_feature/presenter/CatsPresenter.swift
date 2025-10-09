//
//  CatsPresenter.swift
//  cattico
//
//  Created by Abraham Sahid Reyes Rodriguez on 09/10/25.
//
protocol HomePresenterProtocol:AnyObject{
    func homeViewDidLoad()
}


class CatsPresenter {
    private var interactor:CatsInteractor
    weak var homeUI:HomeUI?
    
    init(interactor:CatsInteractor = CatsInteractor()) {
        self.interactor = interactor
    }
    
}

extension CatsPresenter:HomePresenterProtocol {
    func homeViewDidLoad(){
        homeUI?.displayLoading()
        Task{
            do{
                let response = try await interactor.fetchCats()
                homeUI?.displayCats(response)
            }catch{
                homeUI?.displayError(error)
            }
            
        }
        
    }
}
