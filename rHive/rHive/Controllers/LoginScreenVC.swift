import UIKit

class LoginScreenVC: UIViewController {

    var thisUser: User = User(u: "adam", fn: "Adam", ln: "Grant", ps: "asdf", em: "adambest@gmail.com", pn: "8888888888", ad: "Manipal")!
    
    
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func checkCredentials(_ sender: Any) {
        guard let username = username.text, let password = password.text else { //case if handle/password is empty
            print("[Debug] Nil entries for password/username")
            return
        }
        // let usernameRemote: String
        // let passwordRemote: String

        let url = URL(string: "https://asdfwhy.pythonanywhere.com/login")!
        var request = URLRequest(url: url)
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        let postString = "handle=\(username)&rawpw=\(password)"
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
            if responseString == "-1" { //password not matched
                //error routine
                print("[Debug] Wrong Credentials")
            } else { //extract json data to thisUser properties
                print("[Debug] Login was successful")
                performSegue(withIdentifier: "sL", sender: self)    
            }

        }
        task.resume()

        /*  NOTE:::: This code will be used if we resort to hard coded data/persistent data


        if thisUser.username == username.text && thisUser.password == password.text { //enter the application if user authenticated 
            performSegue(withIdentifier: "sL", sender: self)
        } else { //alert to tell invalid creds
        }
        */
    }
}
