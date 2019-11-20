//
//  ImagePickerRouter.swift
//  Viper_Task
//
//  Created by admin on 13/11/19.
//  Copyright © 2019 vina. All rights reserved.
//

import Foundation
import UIKit

class ImagePickerRouter : ImagePickerPresenterToRouterProtocol {
    
    static func createImagePicker() -> UIViewController {
        
        let ImagePickerStoryBoard = UIStoryboard(name: "ImagePicker", bundle: nil)
        
        let navController = ImagePickerStoryBoard.instantiateViewController(withIdentifier: "mainNav")
        
        if let view = navController.children.first as? ImageViewController{
            
            let presenter: ImagePickerViewToPresenterProtocol & ImagePickerInterectorToPresenterProtocol = ImagePickerPresenter()
            
            let interactor: ImagePickerPresentorToInterectorProtocol = ImagePickerInteractor()
            
            let wireFrame: ImagePickerPresenterToRouterProtocol = ImagePickerRouter()
            
            view.presenter = presenter as? LoginViewToPresenterProtocol
            presenter.view = view as? ImagePickerPresenterToViewProtocol
            interactor.presenter = presenter
            presenter.interactor = interactor
            presenter.wireframe = wireFrame
            
            
            
        }
        return navController
    }
   
    
    
    }
    
    




