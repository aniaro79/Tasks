//
//  LoginProtocol.swift
//  Viper_Task
//
//  Created by admin on 12/11/19.
//  Copyright © 2019 vina. All rights reserved.
//

import Foundation
import UIKit

protocol LoginViewToPresenterProtocol: class {
    var view: LoginPresenterToViewProtocol? { get set }
    var router: LoginPresenterToRouterProtocol? { get set }
    func login(withUserName userName: String, andEmail email: String)
}

protocol LoginPresenterToViewProtocol: class {
    var presenter: LoginViewToPresenterProtocol? { get set }
    func loginFailed(withError error: NSError)
}

protocol LoginPresenterToInteractorProtocol: class {
    var presenter: LoginInteractorToPresenterProtocol? { get set }
    func authenticate(_ username: String, email: String)
    
}

protocol LoginInteractorToPresenterProtocol: class {
    var interactor: LoginPresenterToInteractorProtocol? { get set }
    func authenticationSuccessful()
    func authenticationFailed(withError error: NSError)
}

protocol LoginPresenterToRouterProtocol: class {
    static func createLoginModule() -> UIViewController?
    func showImagePickerModule(from view : LoginPresenterToViewProtocol)
}
