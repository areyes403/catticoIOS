//
//  AuthPresenter.swift
//  cattico
//
//  Created by Abraham Sahid Reyes Rodriguez on 09/10/25.
//
protocol LoginPresenterProtocol {
    func loginViewDidLoad()
    func login(email:String,password:String)
}

protocol RegisterPresenterProtocol {
    func registerViewDidLoad()
    func register(id:Int,name:String)
}

class AuthPresenter {
    
    private var interactor:AuthInteractorProtocol
    weak var loginUI:LoginUI?
    weak var registerUI:RegisterUI?
    
    init(interactor: AuthInteractorProtocol = AuthInteractor()) {
        self.interactor = interactor
    }
    
}

extension AuthPresenter: LoginPresenterProtocol {
    
    func loginViewDidLoad() {
        print("loginViewDidLoad")
    }
    
    func login(email: String, password: String) {
        loginUI?.displayLoading()
        Task{
            do {
                try await interactor.singIn(credentials: CredentialsDto(email: email, password: password))
                loginUI?.successLogin()
            }catch {
                loginUI?.showError(message: error.localizedDescription)
            }
        }
        
    }
}

extension AuthPresenter:RegisterPresenterProtocol{
    
    func registerViewDidLoad() {
        print("registerViewDidLoad")
    }
    
    func register(id:Int,name:String){
        Task{
            do{
                try await interactor.signUp(user: UserDto(id: id, name: name))
            }catch {
                registerUI?.showError(message: error.localizedDescription)
            }
        }
    }
    
}
