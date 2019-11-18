

import Foundation
import UIKit
 @available(iOS 13.0, *)
class HomeRouter: HomePresenterToRouterProtocol{
    static func createHomeModule() -> UIViewController? {
        let homeStoryBoard = UIStoryboard(name: "Home", bundle: nil)
        let navcontroller = homeStoryBoard.instantiateViewController(identifier: "mainNav")
        if let view = navcontroller.children.first as? HomeViewController{
            let presenter: HomeViewToPresenterProtocol & HomeInteractorToPresenterProtocol = HomePresenter()
            let interactor: HomePresenterToInteractorProtocol = HomeInteractor()
            let router: HomePresenterToRouterProtocol = HomeRouter()
            view.presenter = presenter as! HomePresenterToViewProtocol
            presenter.view = view as! HomePresenterToViewProtocol
            interactor.presenter = presenter
            presenter.interactor = interactor
            presenter.router = router
        }
        return navcontroller
    }
    
   
    
//    static func createHomeModule() -> UIViewController? {
        
    }



//let ImagePickerStoryBoard = UIStoryboard(name: “ImagePicker”, bundle: nil)
//let navController = ImagePickerStoryBoard.instantiateViewController(withIdentifier: “mainNav”)
//if let view = navController.children.first as? ImageViewController{
//    let presenter: ImagePickerViewToPresenterProtocol & ImagePickerInterectorToPresenterProtocol = ImagePickerPresenter()
//    let interactor: ImagePickerPresentorToInterectorProtocol = ImagePickerInteractor()
//    let wireFrame: ImagePickerPresenterToRouterProtocol = ImagePickerRouter()
//    view.presenter = presenter as? LoginViewToPresenterProtocol
//    presenter.view = view as? ImagePickerPresenterToViewProtocol
//    interactor.presenter = presenter
//    presenter.interactor = interactor
//    presenter.wireframe = wireFrame
