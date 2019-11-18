

import Foundation
import UIKit

class LoginRouter: LoginPresenterToRouterProtocol {
    func pushToHomeScreen(from view: HomePresenterToViewProtocol) {
        
        
        
        
    }
    
    
    static func createLoginModule() -> UIViewController? {
           
           let loginStoryBoard = UIStoryboard(name: "Login", bundle: nil)
           if let view = loginStoryBoard.instantiateInitialViewController() as? LoginViewController
           {
               let presenter: LoginViewToPresenterProtocol & LoginInteractorToPresenterProtocol = LoginPresenter()
               let interactor: LoginPresenterToInteractorProtocol = LoginInteractor()
               let router: LoginPresenterToRouterProtocol = LoginRouter()
               
               view.presenter = presenter
               presenter.view = view
               presenter.interactor = interactor
               interactor.presenter = presenter
               presenter.router = router
               
               return view
           }
           return nil
       }
       
    
//    func pushToHomeScreen(from view: LoginPresenterToViewProtocol) {
//        //let storyboard = UIStoryboard(name: "Home", bundle: nil)
//        
//    }
    
//    func gotoNotificationList(from view: InboxPresenterToViewProtocol,vin: String,selectedMessageType: String?, vehicleNickname: String?) {
//        if let inboxVC = HNInboxDetailBuilder.createNotificationsModule(with: vin,selectedMessageType:selectedMessageType,vehicleNickname: vehicleNickname) {
//            (view as? HNInboxViewController)?.navigationController?.pushViewController(inboxVC, animated: true)
//
//        }

   
    
       


}
