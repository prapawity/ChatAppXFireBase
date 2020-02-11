//
//  ViewController.swift
//  ChatAppXFirebase
//
//  Created by Prapawit Patthasirivichot on 11/2/2563 BE.
//  Copyright © 2563 Prapawit Patthasirivichot. All rights reserved.
//

import UIKit
import Firebase
import FirebaseFirestore
import Alertift
class ViewController: UIViewController {
    var myDb = Firestore.firestore()
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var emailTF: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func signUp(_ sender: Any) {
        if emailTF.text?.isEmpty == false && passwordTF.text?.isEmpty == false{
            Auth.auth().createUser(withEmail: emailTF.text!, password: passwordTF.text!) { authResult, error in
                if error != nil{
                    Alertift.alert(title: "Failed", message: "Please try again")
                    .action(.default("OK"))
                    .show(on: self)
                    print("Failed")
                }else{
                    let uid = authResult?.user.uid
                    self.myDb.collection("AllUser").document("\(self.emailTF.text!)").setData(["email" : "\(self.emailTF.text!)", "uid" : "\(uid!)"])
                    Alertift.alert(title: "Success", message: "Please Login!")
                    .action(.default("OK"))
                    .show(on: self)
                    print("Pass")
                }
            }
        }
    }
    @IBAction func logIn(_ sender: UIButton) {
        if emailTF.text?.isEmpty == false && passwordTF.text?.isEmpty == false{
            Auth.auth().signIn(withEmail: emailTF.text!, password: passwordTF.text!) { [weak self] authResult, error in
                if error != nil{
                    Alertift.alert(title: "Failed", message: "Email or Password is incorrect")
                    .action(.default("OK"))
                    .show(on: self)
                    print(error)
                }else{
                    UserDefaults.standard.setValue(self!.emailTF.text!, forKey: "user")
                    self!.performSegue(withIdentifier: "toMain", sender: nil)
                }
            }
        }
    }
    
}

