//
//  WebVC.swift
//  LRMC
//
//  Created by Marko Dreher on 1/3/19.
//  Copyright © 2019 Marko Dreher. All rights reserved.
//

import UIKit
import WebKit

class WebVC: UIViewController, WKNavigationDelegate {

    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    var type: String?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        webView.navigationDelegate = self
    
        indicator.startAnimating()
        indicator.isHidden = false
        if(type == "patient"){
            if let url = URL(string: "https://patientportal.lrmcenter.com:4443/pls/apex/f?p=2020:LOGIN:0:::APP:G_DB_PORTAL_ID:298&tz=-12:00") {
                let request = URLRequest(url: url)
                webView.load(request)
            }

        }else{
            if let url = URL(string: "https://www.mysecurechart.com/portal/lrmcenter/html/signin.html") {
                let request = URLRequest(url: url)
                webView.load(request)
            }

        }
    
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        indicator.stopAnimating()
        if(type == "patient"){
            insertContentsOfCSSFile(into: webView)
        }
        indicator.isHidden = true
    }
    
    func insertContentsOfCSSFile(into webView: WKWebView) {
//        guard let path = Bundle.main.path(forResource: "styles", ofType: "css") else { return }
//        let cssString = try! String(contentsOfFile: path).trimmingCharacters(in: .whitespacesAndNewlines)
//
//        let js = "var style = document.createElement('style'); style.innerHTML = '\(cssString)'; document.head.appendChild(style);"
        let deviceWidth = UIScreen.main.bounds.width
        let dipWidth = deviceWidth <= 480 ? 480 : ((deviceWidth > 700 && deviceWidth < 1000) ? 768 : 980)
        let jsString = String(format: "var meta = document.createElement('meta'); meta.setAttribute('name', 'viewport'); meta.setAttribute('content', 'width=%d'); meta.setAttribute('initial-scale', '1.0'); meta.setAttribute('maximum-scale', '1.0'); meta.setAttribute('minimum-scale', '1.0'); meta.setAttribute('user-scalable', 'no'); document.getElementsByTagName('head')[0].appendChild(meta);", dipWidth)
        webView.evaluateJavaScript(jsString, completionHandler: nil)
    }
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
