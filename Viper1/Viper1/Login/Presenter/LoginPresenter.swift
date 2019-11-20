//
//  LoginPresenter.swift
//  Viper_Task
//
//  Created by admin on 12/11/19.
//  Copyright © 2019 vina. All rights reserved.
//

import Foundation
class LoginPresenter: LoginViewToPresenterProtocol {
    
    weak var view: LoginPresenterToViewProtocol?
    var interactor: LoginPresenterToInteractorProtocol?
    var router: LoginPresenterToRouterProtocol?
    
    func login(withUserName userName: String, andEmail email: String) {
        interactor?.authenticate(userName, email: email)
    }
}

extension LoginPresenter: LoginInteractorToPresenterProtocol {
    func authenticationSuccessful() {
        router?.showImagePickerModule( from: view!)
    }
    
    func authenticationFailed(withError error: NSError) {
        view?.loginFailed(withError: error)
    }
}
