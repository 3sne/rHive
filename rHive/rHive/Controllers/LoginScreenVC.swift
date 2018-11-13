//
//  LoginScreenVC.swift
//  rHive
//
//  Created by Vinzy on 13/11/18.
//  Copyright © 2018 M2V. All rights reserved.
//

import UIKit

class LoginScreenVC: UIViewController {

    var thisUser: User = User(u: "adam", fn: "Adam", ln: "Grant", ps: "asdf", em: "adambest@gmail.com", pn: "8888888888", ad: "Manipal")!
    
    
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func checkCredentials(_ sender: Any) {
        if thisUser.username == username.text && thisUser.password == password.text {
            performSegue(withIdentifier: "sL", sender: self)
        } else {
            //alert to tell invalid creds
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
