//
//  SignInController.swift
//  Household
//
//  Created by Connor Waldman on 3/2/17.
//  Copyright © 2017 Connor Waldman. All rights reserved.
//

import UIKit
import GoogleAPIClient
import GTMOAuth2

class SignInController: UIViewController, GIDSignInUIDelegate {
    
    @IBOutlet weak var signInButton: GIDSignInButton!
    
    @IBAction func signOutWasPressed(sender: AnyObject) {
        GIDSignIn.sharedInstance().signOut()
    }
    
    @IBOutlet var signOutButton: UIButton!
    
    @IBAction func DriveButton(sender: AnyObject) {
    
    }
    @IBOutlet weak var mapButton: UIButton!
    
    func refreshInterface() {
        if let _ = GIDSignIn.sharedInstance().currentUser {
            signOutButton.hidden = false
           
        } else {
            signOutButton.hidden = true
            
            
            
        }
        
    }
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        refreshInterface()
        (UIApplication.sharedApplication().delegate as! AppDelegate).signInCallback = refreshInterface
        
        GIDSignIn.sharedInstance().uiDelegate = self
        
        // Uncomment to automatically sign in the user.
        // GIDSignIn.sharedInstance().signInSilently()
        
        // TODO(developer) Configure the sign-in button look/feel
        // ...
        GIDSignIn.sharedInstance().scopes.append(kGTLAuthScopeDriveMetadataReadonly)
        
        
        
    }
    
}
