//
//  CatsInteractor.swift
//  cattico
//
//  Created by Abraham Sahid Reyes Rodriguez on 09/10/25.
//
protocol CatsInteractorProtocol:AnyObject{
    func fetchCats() async throws -> [Cat]
    func fetchCat(id:String) async throws -> CatBreed
}

class CatsInteractor:CatsInteractorProtocol {

    private var apiService:CatApiService
    //var presenter: CatsPresenter?
    
    init(apiService:CatApiService = CatApiServiceImpl.instance) {
        self.apiService = apiService
    }
    
    func fetchCats() async throws -> [Cat] {
        return try await apiService.fetchDataCats().map { dto in
            Cat(
                id: dto.id,
                url: dto.url,
                width: dto.width,
                height: dto.height
            )
        }
    }
    
    func fetchCat(id: String) async throws -> CatBreed {
        let dto = try await apiService.fetchCat(id: id)
        if let breed = dto.breeds?.first {
            return breed
        }else{
            throw Errors.NoDataFound
        }
    }
    
}
