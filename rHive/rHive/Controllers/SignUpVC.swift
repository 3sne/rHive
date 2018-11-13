//
//  SignUpVC.swift
//  rHive
//
//  Created by Vinzy on 13/11/18.
//  Copyright © 2018 M2V. All rights reserved.
//

import UIKit

class SignUpVC: UIViewController {

    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var firstName: UITextField!
    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var vpassword: UITextField!
    @IBOutlet weak var phoneNumber: UITextField!
    @IBOutlet weak var address: UITextField!
    
    var signedUpUser: User?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func disThis(_ sender: Any) {
        signedUpUser = User(u: username.text, fn: firstName.text, ln: lastName.text, ps: password.text, em: email.text, pn: phoneNumber.text, ad: address.text)
        if let signedUpUser = signedUpUser {
            if password == vpassword {
                print("Signup was successful")
                self.dismiss(animated: true, completion: nil)
            } else {
//                let myColor : UIColor = UIColor.red
//                password.layer.borderColor = myColor.cgColor
                password.text = ""
                vpassword.text = ""
            }
        } else {
            //error routine
            print("Error")
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
