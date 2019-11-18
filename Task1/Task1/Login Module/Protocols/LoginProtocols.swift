

import Foundation
import UIKit

protocol LoginViewToPresenterProtocol: class {
    var view: LoginPresenterToViewProtocol? { get set }
    var router: LoginPresenterToRouterProtocol? { get set }
    func login(userName: String, emailID: String)
}

protocol LoginPresenterToViewProtocol: class {
    var presenter: LoginViewToPresenterProtocol? { get set }
    func loginFailed()
}

protocol LoginPresenterToInteractorProtocol: class {
    var presenter: LoginInteractorToPresenterProtocol? { get set }
    func authenticate(_ userName: String, emailID: String)
    func validEmail (emailID : String) -> Bool
}

protocol LoginInteractorToPresenterProtocol: class {
    var interactor: LoginPresenterToInteractorProtocol? { get set }
    func authenticationSuccessful()
    func authenticationFailed()
    
}

protocol LoginPresenterToRouterProtocol: class {
    static func createLoginModule() -> UIViewController?
    func pushToHomeScreen(from view: HomePresenterToViewProtocol)
}

