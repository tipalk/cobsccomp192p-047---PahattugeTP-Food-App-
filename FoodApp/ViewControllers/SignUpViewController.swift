//
//  SignUpViewController.swift
//  FoodApp
//
//  Created by Tiny Pahattuge on 2021-03-03.
//

import UIKit
import FirebaseAuth
import Firebase

class SignUpViewController: UIViewController {

    @IBOutlet weak var passwordtext: UITextField!
    @IBOutlet weak var emailaddresstext: UITextField!
    @IBOutlet weak var phonenumbertext: UITextField!
    @IBOutlet weak var forgetpassbutton: UIButton!
    @IBOutlet weak var loginbutton: UIButton!
    @IBOutlet weak var registerbutton: UIButton!
    @IBOutlet weak var errortext: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // validate fields
    func  validatefields() -> String? {
        if emailaddresstext.text?.trimmingCharacters(in: .whitespacesAndNewlines) == ""
            || phonenumbertext.text?.trimmingCharacters(in: .whitespacesAndNewlines)==""
            || passwordtext.text?.trimmingCharacters(in: .whitespacesAndNewlines) == ""
        {
            return "Please fill all the fields"
        }
        
        return nil
    }

    @IBAction func Registertapped(_ sender: Any) {
        
        let error = validatefields()
        if error != nil {
            showError(message: error!)
        }
        else
        {
            let email = emailaddresstext.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let password = passwordtext.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let phonenumber = phonenumbertext.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            Auth.auth().createUser(withEmail:email, password:password) { (result, err) in
                
                if  err != nil {
                    self.showError(message: "Error creating user")
                }
                else
                {
                    let db = Firestore.firestore()
                    db.collection("users").addDocument( data: ["email":email, "password":password, "phonenumber":phonenumber, "uid": result?.user.uid ]) { (error) in
                        
                        if error != nil
                        {
                            self.showError(message: "Error saving user data")
                            
                        }
                        
                        
                    }
                    self.goHomePage()
                    
                }
            }
        }
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
