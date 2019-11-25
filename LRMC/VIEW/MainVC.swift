//
//  MainVC.swift
//  LRMC
//
//  Created by Marko Dreher on 1/3/19.
//  Copyright © 2019 Marko Dreher. All rights reserved.
//

import UIKit



class MainVC: UIViewController {

    @IBOutlet weak var btn1: UIButton!
    @IBOutlet weak var btn2: UIButton!
    @IBOutlet weak var btn3: UIButton!
    @IBOutlet weak var btn4: UIButton!
    @IBOutlet weak var btn5: UIButton!
    
    @IBOutlet weak var btn6: UIButton!
    @IBOutlet weak var btn7: UIButton!
    @IBOutlet weak var btn8: UIButton!
    @IBOutlet weak var btn9: UIButton!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        btn1.clipsToBounds  = true
        btn1.layer.cornerRadius = 4
        btn2.clipsToBounds  = true
        btn2.layer.cornerRadius = 4
        btn3.clipsToBounds  = true
        btn3.layer.cornerRadius = 4
        btn4.clipsToBounds  = true
        btn4.layer.cornerRadius = 4
        btn5.clipsToBounds  = true
        btn5.layer.cornerRadius = 4
        btn6.clipsToBounds  = true
        btn6.layer.cornerRadius = 4
    }
    
    @IBAction func callLRMC(_ sender: Any) {
        if let url = URL(string: "tel://8436638000"), UIApplication.shared.canOpenURL(url) {
            if #available(iOS 10, *) {
                UIApplication.shared.open(url)
            } else {
                UIApplication.shared.openURL(url)
            }
        }
    }
    @IBAction func goToDental(_ sender: Any) {
        let nextViewController = storyboard?.instantiateViewController(withIdentifier: "WebVC") as! WebVC
        nextViewController.type = "dental"
        self.present(nextViewController, animated:true, completion:nil)
    }
    
    @IBAction func goTOPatient(_ sender: Any) {
        let nextViewController = storyboard?.instantiateViewController(withIdentifier: "WebVC") as! WebVC
        nextViewController.type = "patient"
        self.present(nextViewController, animated:true, completion:nil)
    }
    @IBAction func LocalApp(_ sender: Any) {
        
        let url = "apps.apple.com/us/app/rxlocal/id437564871"
        let endPointURL = NSURL(string: url)
        let appURLScheme = "myapp1://"
        
        guard let appURL = URL(string: appURLScheme) else {
            return
        }
        
        if UIApplication.shared.canOpenURL(appURL)
        {
            
            if #available(iOS 10.0, *) {
                UIApplication.shared.open(appURL)
            }
            else {
                UIApplication.shared.openURL(appURL)
            }
        }
        else {
            
            print("Application is not installed")
            UIApplication.shared.openURL(endPointURL! as URL)
            
            
        }
        
        
    }
    @IBAction func newPortal(_ sender: Any) {
        
        let url = "https://apps.apple.com/us/app/healow/id595012291"
        let endPointURL = NSURL(string: url)
        let appURLScheme = "myapp1://"
        
        guard let appURL = URL(string: appURLScheme) else {
            return
        }
        
        if UIApplication.shared.canOpenURL(appURL)
        {
            
            if #available(iOS 10.0, *) {
                UIApplication.shared.open(appURL)
            }
            else {
                UIApplication.shared.openURL(appURL)
            }
        }
        else {
            
            print("Application is not installed")
            UIApplication.shared.openURL(endPointURL! as URL)
            
            
        }
    }
    @IBAction func medicationList(_ sender: Any) {
        
//        let controller = self.storyboard?.instantiateViewController(withIdentifier: "DrugListVC") as! DrugListVC
//        //            controller.webVIewUrl = url
//        self.navigationController?.pushViewController(controller, animated: true)
        
        
        let nextViewController = storyboard?.instantiateViewController(withIdentifier: "DrugListVC") as! DrugListVC
        
        self.present(nextViewController, animated:true, completion:nil)
        
        
        
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
