

import Foundation
import UIKit

class LoginViewController: UIViewController {
    
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    
    var presenter: LoginViewToPresenterProtocol?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func logIn(_ sender: Any) {
        
        guard let name = nameTextField.text, nameTextField.text?.isEmpty == false  else {
            
            
            
            let alert = UIAlertController(title: "Alert", message: "Please enter a name.", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            
            return
        }
        
        guard let email = emailTextField.text, emailTextField.text?.isEmpty == false  else {
            let alert = UIAlertController(title: "Alert", message: "Please enter an email address.", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            return
        }
        
        presenter?.login(userName: name, emailID: email)
    }
}
    
    extension LoginViewController: LoginPresenterToViewProtocol {
        func loginFailed() {
            let alert = UIAlertController(title: "Alert", message: "Please enter a valid email address.", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        
    }
    
    
        
        
    

    
    


