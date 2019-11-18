//
//  LoginInteractor.swift
//  Viper_Task
//
//  Created by admin on 12/11/19.
//  Copyright © 2019 vina. All rights reserved.
//

import Foundation
class LoginInteractor: LoginPresenterToInteractorProtocol {
 
    weak var presenter: LoginInteractorToPresenterProtocol?
    
    func authenticate(_ username: String, email: String) {
        
        
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        
        if (emailTest.evaluate(with: email) == true) {
        self.presenter?.authenticationSuccessful()
        }
        else{
        let err = NSError(domain: "", code: 401, userInfo: [NSLocalizedDescriptionKey: NSLocalizedString(" Invalid Email",comment: "")])
        self.presenter?.authenticationFailed(withError: err)
        return
        }
}
    
}
