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
            if password == vpassword { //Attempt to make new db entry
                let url = URL(string: "https://asdfwhy.pythonanywhere.com/createAccount")!
                var request = URLRequest(url: url)
                request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
                request.httpMethod = "POST"
                let postString = "id=13&name=Jack"
                let postString = "handle=\(u)&realname=\(fn)%20\(ln)&encPassword=\(ps)&email=\(em)&address=\(ad)&primaryPhone=\(pn)"
                request.httpBody = postString.data(using: .utf8)
                let task = URLSession.shared.dataTask(with: request) { data, response, error in
                    guard let data = data, error == nil else {                                                 // check for fundamental networking error
                        print("[Debug] error=\(error)")
                        return
                    }

                    if let httpStatus = response as? HTTPURLResponse, httpStatus.statusCode != 200 {           // check for http errors
                        print("[Debug] statusCode should be 200, but is \(httpStatus.statusCode)")
                        print("[Debug] response = \(response)")
                    }

                    let responseString = String(data: data, encoding: .utf8)
                    print("[Debug] responseString = \(responseString)")
                }
                print("[Debug] Signup was successful")
                task.resume()
                self.dismiss(animated: true, completion: nil)
            } else { //highlight erroneous pw and vpw fields and reset them
                //let myColor : UIColor = UIColor.red
                //password.layer.borderColor = myColor.cgColor
                password.text = ""
                vpassword.text = ""
            }
        } else { //error routine
            print("[Debug] Empty Fields Error, all fields are compulsory")
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
