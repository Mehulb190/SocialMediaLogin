//
//  ViewController.swift
//  SocialMediaLogin
//
//  Created by Mehul Chauhan on 21/04/16.
//  Copyright © 2016 Techsavy. All rights reserved.
//

import UIKit
import TwitterKit
import TwitterCore
import Google

class ViewController: UIViewController, GIDSignInUIDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        GIDSignIn.sharedInstance().uiDelegate = self

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btnFacebookLoginEvent(sender: AnyObject) {
    }
    
    @IBAction func btnTwitterLoginEvent(sender: AnyObject) {
        Twitter.sharedInstance().logInWithCompletion { session, error in
            if (session != nil) {
                print("signed in as \(session?.userName)");
                let name: String! = session?.userName;
                
                //AlertView
                let alertController = UIAlertController(title: "Twitter", message:
                    "Welcome, \(name)", preferredStyle: UIAlertControllerStyle.Alert)
                alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default,handler: nil))
                
                self.presentViewController(alertController, animated: true, completion: nil)
                
            } else {
                print("error: \(error?.description)");
                
                //AlertView
                let alertController = UIAlertController(title: "Alert!", message:
                    "\(error?.description)", preferredStyle: UIAlertControllerStyle.Alert)
                alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.Default,handler: nil))
                
                self.presentViewController(alertController, animated: true, completion: nil)
                
            }
            
        }
    }
    
    @IBAction func btnGoogleLoginEvent(sender: AnyObject) {
        GIDSignIn.sharedInstance().signIn()
    }

}

