//
//  LoginViewController.swift
//  FoodApp
//
//  Created by Tiny Pahattuge on 2021-03-04.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {

    @IBOutlet weak var emailaddresstext: UITextField!
    @IBOutlet weak var passwordtext: UITextField!
    @IBOutlet weak var loginbutton: UIButton!
    @IBOutlet weak var errortext: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func Logintapped(_ sender: Any) {
        
        let error = validatefields()
        if error != nil {
            self.showError(message: "Error creating user")
        }
        else
        {
            let email = emailaddresstext.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let password = passwordtext.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            
            Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
                if error != nil
                {
                    self.errortext.text = error?.localizedDescription
                    self.errortext.alpha=1
                }
                else
                {
                    self.goHomePage()
                }
            }
            
        }
    }
    
    func  validatefields() -> String? {
        if emailaddresstext.text?.trimmingCharacters(in: .whitespacesAndNewlines) == ""
            || passwordtext.text?.trimmingCharacters(in: .whitespacesAndNewlines) == ""
        {
            return "Please fill all the fields"
        }
        
        return nil
    }
    
    func showError(message :String) {
        errortext.text = message
        errortext.alpha = 1
        
    }
    
    func goHomePage()  {
        let HomeViewController = storyboard?.instantiateViewController(identifier: Constants.storyboard.HomeViewController  )as? ViewController
        view.window?.rootViewController = HomeViewController
        view.window?.makeKeyAndVisible()
    }

}
