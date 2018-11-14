import UIKit

class LoginScreenVC: UIViewController {

    var thisUser: User = User(u: "adam", fn: "Adam", ln: "Grant", ps: "asdf", em: "adambest@gmail.com", pn: "8888888888", ad: "Manipal")!
    var rString: String = ""
    
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /*
         UI Test
         */
        let blurEffect = UIBlurEffect(style: .prominent)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = view.frame
        view.addSubview(blurEffectView)
        view.sendSubview(toBack: blurEffectView)
        self.view.backgroundColor = UIColor(patternImage: (UIImage(named:"bg-2.jpg")!))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func checkCredentials(_ sender: Any) {
        guard let username = username.text, let password = password.text else { //case if handle/password is empty
            print("[Debug] Nil entries for password/username")
            return
        }
        let url = URL(string: "https://asdfwhy.pythonanywhere.com/login")!
        var request = URLRequest(url: url)
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        let postString = "handle=\(username)&rawpw=\(password)"
        request.httpBody = postString.data(using: .utf8)
        let syncSemaphore = DispatchSemaphore(value: 0)
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {                                                 // check for fundamental networking error
                print("[Debug] error=\(String(describing: error))")
                return
            }

            if let httpStatus = response as? HTTPURLResponse, httpStatus.statusCode != 200 {           // check for http errors
                print("[Debug] statusCode should be 200, but is \(httpStatus.statusCode)")
                print("[Debug] response = \(String(describing: response))")
            }

            let responseString = String(data: data, encoding: .utf8)
            print("[Debug] responseString = \(String(describing: responseString))")
            
            if let responseString = responseString {
                self.rString = responseString
            } else {
                self.rString = "-1"
            }
            syncSemaphore.signal()
        }
        task.resume()
        
        /* Show circle loading thing */
        let indicator: UIActivityIndicatorView = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.gray)
        indicator.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
        indicator.center = view.center
        self.view.addSubview(indicator)
        self.view.bringSubview(toFront: indicator)
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        indicator.startAnimating()
        
        _ = syncSemaphore.wait(timeout: .distantFuture)
        
        indicator.stopAnimating()
        
        
        /* Process server response */
        if rString == "-1" { //password not matched
            //error routine
            print("[Debug] Wrong Credentials")
            self.password.text = ""
            UIView.animate(withDuration: 0.2, animations: {
                
                let rightTransform  = CGAffineTransform(scaleX: 1.1, y: 1.0)
                self.password.transform = rightTransform
                
            }) { (_) in
                
                UIView.animate(withDuration: 0.2, animations: {
                    self.password.transform = CGAffineTransform.identity
                })
            }
            
        } else { //extract json data to thisUser properties
            
            print("[Debug] Login was successful")
            self.performSegue(withIdentifier: "sL", sender: nil)
        }
        
        
        /*  NOTE:::: This code will be used if we resort to hard coded data/persistent data


        if thisUser.username == username.text && thisUser.password == password.text { //enter the application if user authenticated 
            performSegue(withIdentifier: "sL", sender: self)
        } else { //alert to tell invalid creds
        }
        */
    }
}
