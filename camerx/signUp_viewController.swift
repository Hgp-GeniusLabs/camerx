//
//  signUp_viewController.swift
//  camerx
//
//  Created by HGPMac62 on 7/23/18.
//  Copyright © 2018 HGPMac62. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseCore

class signUp_viewController: UIViewController, UITextFieldDelegate {


    @IBOutlet weak var reenter: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    
 
    override func viewDidLoad() {
        super.viewDidLoad()
        self.email.delegate = self
        self.password.delegate = self
        // Do any additional setup after loading the view.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        email.resignFirstResponder()
        password.resignFirstResponder()
        reenter.resignFirstResponder()
        return(true)
        
    }
    
    @IBAction func loginBtn(_ sender: Any) {
        Auth.auth().createUser(withEmail: email.text!, password: password.text!) { (user, Error) in
            if user != nil && self.password.text == self.reenter.text {
                
                print("user created")
                
            }
            else{
                print("error")
                let alert = UIAlertController(title: "Passwords do not match", message: nil, preferredStyle: .alert)
                let okButton = UIAlertAction(title: "ok", style: .default, handler: nil)
                alert.addAction(okButton)
                self.present(alert, animated: true,completion: nil)
        }
         
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
