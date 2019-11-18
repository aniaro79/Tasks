

import Foundation
import UIKit

class LoginInteractor: LoginPresenterToInteractorProtocol{
    var presenter: LoginInteractorToPresenterProtocol?
    
    func authenticate(_ username: String, emailID: String) {
      
        
        if validEmail(emailID: emailID) == false {
            presenter?.authenticationFailed()
        }

        if validEmail(emailID: emailID) == true {
            presenter?.authenticationSuccessful()
        }

    }
    func validEmail (emailID : String) -> Bool
          {
              let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
              let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
              return emailTest.evaluate(with: emailID)
          }
    
}
