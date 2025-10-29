//
//  CatsPresenter.swift
//  cattico
//
//  Created by Abraham Sahid Reyes Rodriguez on 09/10/25.
//
protocol HomePresenterProtocol:AnyObject{
    func homeViewDidLoad()
}

protocol CatDetailsPresenterProtocol:AnyObject{
    func catDetailsViewDidLoad(catId:String)
}


class CatsPresenter {
    private var interactor:CatsInteractor
    
    weak var homeUI:HomeUI?
    weak var catDetailsUI:CatDetailsUI?
    
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

extension CatsPresenter:CatDetailsPresenterProtocol{
    func catDetailsViewDidLoad(catId: String) {
        catDetailsUI?.displayLoading()
        Task{
            do {
                let response = try await interactor.fetchCat(id: catId)
                catDetailsUI?.displayCat(response)
            }catch {
                catDetailsUI?.displayError(error)
            }
        }
    }
    
}
