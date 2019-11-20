//
//  ImagePickerProtocols.swift
//  Viper_Task
//
//  Created by admin on 13/11/19.
//  Copyright © 2019 vina. All rights reserved.
//

import Foundation
import UIKit

protocol ImagePickerPresenterToViewProtocol: class {
    
}

protocol ImagePickerInterectorToPresenterProtocol: class {
    
   
}

protocol ImagePickerPresentorToInterectorProtocol: class {
    var presenter: ImagePickerInterectorToPresenterProtocol? { get set }
 
}

protocol ImagePickerViewToPresenterProtocol: class {
    var view : ImagePickerPresenterToViewProtocol? { get set }
    var interactor :ImagePickerPresentorToInterectorProtocol? { get set }
    var wireframe : ImagePickerPresenterToRouterProtocol? { get set }

    

}
    
    


protocol ImagePickerPresenterToRouterProtocol: class{
   static func createImagePicker() -> UIViewController
    

}



