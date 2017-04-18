//
//  FilePicker.swift
//  Household
//
//  Created by Connor Waldman on 4/13/17.
//  Copyright © 2017 Connor Waldman. All rights reserved.
//

import GoogleAPIClientForREST
import GTMOAuth2
import UIKit

class FilePicker: UIViewController {
    
    private let service = GTLRDriveService()
    let output = UITextView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        output.frame = view.bounds
        output.editable = false
        output.contentInset = UIEdgeInsets(top: 20, left: 0, bottom: 20, right: 0)
        output.autoresizingMask = [.FlexibleHeight, .FlexibleWidth]
        
        view.addSubview(output);
        
    }
    
    override func viewDidAppear(animated: Bool) {
        if let authorizer = service.authorizer,
            canAuth = authorizer.canAuthorize where canAuth {
                listFiles()
        } else {
            "error"
        }
    }
    
    func listFiles() {
        let query = GTLRDriveQuery_FilesList.query()
        service.executeQuery(query,
            delegate: self,
            didFinishSelector: "displayResultWithTicket:finishedWithObject:error:"
        )
    }
       func showAlert(title : String, message: String) {
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: UIAlertControllerStyle.Alert
        )
        let ok = UIAlertAction(
            title: "OK",
            style: UIAlertActionStyle.Default,
            handler: nil
        )
        alert.addAction(ok)
        presentViewController(alert, animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}