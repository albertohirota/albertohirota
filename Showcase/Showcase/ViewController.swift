//
//  ViewController.swift
//  Showcase
//
//  Created by Alberto Hirota on 8/17/16.
//  Copyright © 2016 Alberto Hirota. All rights reserved.
//

import UIKit
import FBSDKLoginKit
import FBSDKCoreKit
import Firebase
import FirebaseAuth
import FirebaseDatabase


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        if NSUserDefaults.standardUserDefaults().valueForKey(KEY_UID) != nil {
        self.performSegueWithIdentifier(SEGUE_LOGGED_IN, sender: nil)
        }
    }
    
    
    @IBAction func fbBtnPressed(sender: UIButton!) {
        let facebookLogin = FBSDKLoginManager()
        facebookLogin.logInWithReadPermissions(["email"], fromViewController: self) { (facebookResult: FBSDKLoginManagerLoginResult!, facebookError: NSError!) -> Void in
            if facebookError != nil {
                print("Facebook login failed. Error \(facebookError)")
            } else {
              let accessToken = FBSDKAccessToken.currentAccessToken().tokenString //OLDWAY
                let credential = FIRFacebookAuthProvider.credentialWithAccessToken(accessToken)
                
                //DataService.ds.REF_BASE.authWithAuthProvider("facebook", String!, accessToken: String!, withCompletionBlock: { error, authData in
                //login in facebook, but need to store, but need to store data in Firebase, OLD WAY
                
                FIRAuth.auth()?.signInWithCredential(credential) { (user, error) in
                
                if let error = error {
                        print("Login failed. \(error.localizedDescription)")
                    } else {
                        print("Logged In! \(user!.uid)")
                        NSUserDefaults.standardUserDefaults().setValue(user!.uid, forKey: KEY_UID)
                        // not logged to a new view controller
                        self.performSegueWithIdentifier(SEGUE_LOGGED_IN, sender: nil)
                    }
                    }
                //})
           }
        }
    }
}

