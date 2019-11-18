//
//  LoginRouter.swift
//  Viper_Task
//
//  Created by admin on 12/11/19.
//  Copyright © 2019 vina. All rights reserved.
//

import Foundation
import UIKit

class LoginRouter: LoginPresenterToRouterProtocol {
  
    static func createLoginModule() -> UIViewController? {
        
        let loginStoryBoard = UIStoryboard(name: "Login", bundle: nil)
        
        if let view = loginStoryBoard.instantiateInitialViewController() as? LoginViewController {
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
    
    
   func showImagePickerModule(from view: LoginPresenterToViewProtocol) {
         print("showImagePickerModule")
        
    let NavigationVC = ImagePickerRouter.createImagePicker()
            if let sourceView = view as? UIViewController{
            print("showImagePickerModule")
            sourceView.addChild(NavigationVC)
            sourceView.view.addSubview(NavigationVC.view)
            NavigationVC.didMove(toParent: sourceView)

   }
    }

}
