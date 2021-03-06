//
//  LoginViewController.swift
//  Instagram
//
//  Created by Joey Singer on 3/20/17.
//  Copyright © 2017 Joey Singer. All rights reserved.
//

import UIKit
import Parse
class LoginViewController: UIViewController {

    
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var userNameField: UITextField!
    
  
override func viewDidLoad() {
        super.viewDidLoad()
        let tabBarController = UITabBarController()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func onSignIn(_ sender: Any) {
       PFUser.logInWithUsername(inBackground: userNameField.text!, password: passwordField.text!) { (user, error) in
        if user != nil{
            print("Logged In")
            self.performSegue(withIdentifier: "loginSegue", sender: nil)
        
        }else{
            print(error?.localizedDescription)
        }
        }
    }
    
    @IBAction func onSignUp(_ sender: Any) {
        let newUser = PFUser()
        
        newUser.username = userNameField.text
        newUser.password = passwordField.text
        
        newUser.signUpInBackground { (success, error) in
            if success{
                print("Added User")
                 self.performSegue(withIdentifier: "loginSegue", sender: nil)
            }else{
                print(error?.localizedDescription)
            }
            
            
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
