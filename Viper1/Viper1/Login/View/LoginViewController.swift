//
//  LoginViewController.swift
//  Viper_Task
//
//  Created by admin on 12/11/19.
//  Copyright © 2019 vina. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController{

    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var emailTextField: UITextField!
    
    var presenter: LoginViewToPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameTextField.text = "abc"
        emailTextField.text = "abc@gmail.com"
        // Do any additional setup after loading the view.
    }
    @IBAction func Login(_ sender: Any) {
       

        
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
        
        
        nameTextField.resignFirstResponder()
        emailTextField.resignFirstResponder()
        presenter?.login(withUserName: name, andEmail: email)
//
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}



extension LoginViewController: LoginPresenterToViewProtocol {
    func loginFailed(withError error: NSError) {
        self.showAlert(withMessage: error.localizedDescription)
    }
}
