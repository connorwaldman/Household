//
//  ViewController.swift
//  Household
//
//  Created by Connor Waldman on 2/18/17.
//  Copyright © 2017 Connor Waldman. All rights reserved.
//

import UIKit
import WebKit

class DriveViewController: UIViewController, WKUIDelegate {
    
    var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Create WKWebView in code, because IB cannot add a WKWebView directly
        webView = WKWebView()
        webView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(webView)
        view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("|-[webView]-|",
            options: NSLayoutFormatOptions(rawValue: 0),
            metrics: nil,
            views: ["webView": webView]))
        view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|-20-[webView]-|",
            options: NSLayoutFormatOptions(rawValue: 0),
            metrics: nil,
            views: ["webView": webView]))
        
        webView.sendSubviewToBack(webView)

        
        
            let urlString = "https://connorwaldman.github.io"
            guard let url = NSURL(string: urlString) else {return}
            let request = NSMutableURLRequest(URL:url)
            webView.loadRequest(request)
        
        
        webView.UIDelegate = self
        
    
    }
    
    
}