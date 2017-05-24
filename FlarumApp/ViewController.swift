//
//  ViewController.swift
//  FlarumApp
//
//  Created by Chamath Palihawadana on 5/24/17.
//  Copyright © 2017 Chamath Palihawadana. All rights reserved.
//


import UIKit

class ViewController: UIViewController,UIWebViewDelegate  {
    
    @IBOutlet weak var webView: UIWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        showActivityIndicator()
        webView.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
        let u2 = URL(string: "https://discuss.flarum.org");
        let u = URLRequest(url: u2!);
        webView.loadRequest(u);
        webView.scrollView.bounces = false;
    }
    func webViewDidFinishLoad(_ webView : UIWebView) {
        hideActivityIndicator()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewDidLayoutSubviews() {
        webView.frame = CGRect(x:0, y:64, width: self.view.frame.size.width, height: self.view.frame.size.height-64);
    }
    
    func showActivityIndicator() {
        let activityIndicator = UIActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        activityIndicator.backgroundColor = UIColor(red:0.16, green:0.17, blue:0.21, alpha:0.3)
        activityIndicator.layer.cornerRadius = 6
        activityIndicator.center = view.center
        activityIndicator.hidesWhenStopped = true
        activityIndicator.activityIndicatorViewStyle = .whiteLarge
        activityIndicator.startAnimating()
        //UIApplication.shared.beginIgnoringInteractionEvents()
        
        activityIndicator.tag = 100 // 100 for example
        
        // before adding it, you need to check if it is already has been added:
        for subview in view.subviews {
            if subview.tag == 100 {
                print("already added")
                return
            }
        }
        
        view.addSubview(activityIndicator)
    }
    
    func hideActivityIndicator() {
        let activityIndicator = view.viewWithTag(100) as? UIActivityIndicatorView
        activityIndicator?.stopAnimating()
        
        // I think you forgot to remove it?
        activityIndicator?.removeFromSuperview()
        
        //UIApplication.shared.endIgnoringInteractionEvents()
    }
    
    
}

