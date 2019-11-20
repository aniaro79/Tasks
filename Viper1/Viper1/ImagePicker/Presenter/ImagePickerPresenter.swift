//
//  ImagePickerPresenter.swift
//  Viper_Task
//
//  Created by admin on 13/11/19.
//  Copyright © 2019 vina. All rights reserved.
//

import Foundation
import UIKit
class ImagePickerPresenter:ImagePickerViewToPresenterProtocol,ImagePickerInterectorToPresenterProtocol{
   
    
   
    
    var view: ImagePickerPresenterToViewProtocol?
    
    var interactor: ImagePickerPresentorToInterectorProtocol?
    
    var wireframe: ImagePickerPresenterToRouterProtocol?
    

}


