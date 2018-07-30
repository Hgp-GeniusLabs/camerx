//
//  login_ViewController.swift
//  camerx
//
//  Created by HGPMac62 on 7/23/18.
//  Copyright © 2018 HGPMac62. All rights reserved.
//

import UIKit
import FirebaseCore
import FirebaseAuth
var isLoggedIn = false





class login_ViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var email_L: UITextField!
    
    @IBOutlet weak var password_L: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.email_L.delegate = self
        self.password_L.delegate = self
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        email_L.resignFirstResponder()
        password_L.resignFirstResponder()
        return(true)
        
    }
    
    
    
    
    
    @IBAction func login_L(_ sender: Any) {
        Auth.auth().signIn(withEmail: email_L.text!, password: password_L.text!) { (user, error) in
            if user != nil{
                self.performSegue(withIdentifier: "login", sender: self)
                print("user logged in")
            }else{
                print("error")
                let alert = UIAlertController(title: "Email or password is incorrect", message: nil, preferredStyle: .alert)
                let okButton = UIAlertAction(title: "ok", style: .default, handler: nil)
                alert.addAction(okButton)
                self.present(alert, animated: true,completion: nil)
            }
            
            isLoggedIn = true
        }
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
