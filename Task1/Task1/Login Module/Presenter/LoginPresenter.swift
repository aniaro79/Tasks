

import Foundation
import UIKit

class LoginPresenter: LoginViewToPresenterProtocol {
    var interactor: LoginPresenterToInteractorProtocol?
    weak var view: LoginPresenterToViewProtocol?
    var router: LoginPresenterToRouterProtocol?
    
    func login(userName: String, emailID email: String) {
        interactor?.authenticate(userName, emailID: email)
    }
}

extension LoginPresenter: LoginInteractorToPresenterProtocol {
   
    func authenticationSuccessful() {
        //navigate to Home screen
        //router?.pushToHomeScreen(from: UIViewController)
        
    }
    
    func authenticationFailed() {
        view?.loginFailed()
    }
}
