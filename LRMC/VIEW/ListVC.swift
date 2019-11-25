//
//  ListVC.swift
//  LRMC
//
//  Created by Marko Dreher on 1/3/19.
//  Copyright © 2019 Marko Dreher. All rights reserved.
//

import UIKit

class ListVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var serviceList: [String] = ["Medical", "Dental", "Pharmacy", "Behavioral Health", "WIC", "HIV/AIDS", "Migrant", "Seasonal Farm Worker", "Homeless", "Chronic Care Management", "Telehealth", "School Dental"]

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return serviceList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ServiceCell", for: indexPath) as! ServiceCell
        
        cell.serviceName.text = serviceList[indexPath.row]
        return cell
        
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
