//
//  ViewController.swift
//  OpenWebViewInPopup
//
//  Created by Sanjay Mishra on 13/12/19.
//  Copyright © 2019 Sanjay Mishra. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController {
    @IBOutlet var popupView: UIView!
    
    @IBOutlet weak var wkWebView: WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        popupView.frame = CGRect(x: 50, y: 15, width: view.bounds.width, height: view.bounds.height)
    }
    @IBAction func btnCloseWkWebCiew(_ sender: UIButton) {
        animationOut()
    }
    @IBAction func openAccountActionTapped(_ sender: UIButton) {
        animationIn()
    }
   func animationIn() {
        self.view.addSubview(popupView)
        popupView.center = self.view.center
        popupView.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)
        popupView.alpha = 0
        UIView.animate(withDuration: 0.4) {
            self.popupView.alpha = 1
            self.popupView.transform = CGAffineTransform.identity
            self.lodUrlInWebView()
        }
    }
    func animationOut() {
        UIView.animate(withDuration: 0.3, animations: {
            self.popupView
                .transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)
            self.popupView.alpha = 0
        }) { (success:Bool) in
            self.popupView.removeFromSuperview()
        }
    }
    
    func lodUrlInWebView() {
        let url = URL(string: "https://www.google.com/")
        let urlRequest = URLRequest(url: url!)
        wkWebView.load(urlRequest)
    }
    
}

