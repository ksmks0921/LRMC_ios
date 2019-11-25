//
//  DrugListVC.swift
//  LRMC
//
//  Created by ujs on 11/24/19.
//  Copyright © 2019 Marko Dreher. All rights reserved.
//

import UIKit
import Foundation
import CSV

class DrugListVC: UIViewController,  UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var table_1: UITableView!
    @IBOutlet weak var table_2: UITableView!
    
    @IBOutlet weak var freeBtn: UIButton!
    @IBOutlet weak var discountBtn: UIButton!
    
    @IBOutlet weak var freeTitle: UIView!
    @IBOutlet weak var discountTitle: UIView!
    
    var freeArray = [FreeModel]()
    var discountArray = [DiscountModel]()
   
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if tableView == self.table_1  {
            return freeArray.count
        }
        else  if tableView == self.table_2{
            return discountArray.count
        }
        else {
            return 4
        }
        
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
     
     
        if tableView == self.table_1 {
            
        let cell = tableView.dequeueReusableCell(withIdentifier: "DrugFreeCell", for: indexPath) as! DrugFreeCell
            
           
                
                cell.name.text = freeArray[indexPath.row].name
                cell.quantity.text = freeArray[indexPath.row].quantity
                
                cell.pay.text = "Free"
            
            return cell
        }
            
        else if tableView == self.table_2 {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "DrugDiscountCell", for: indexPath) as! DrugDiscountCell
            
           
            
                
                cell.name.text = discountArray[indexPath.row].name
                cell.quan_1.text = discountArray[indexPath.row].quantity_1
                cell.pay_1.text = discountArray[indexPath.row].price_1
                cell.quan_2.text = discountArray[indexPath.row].quantity_2
                cell.pay_2.text = discountArray[indexPath.row].price_2
                
                
            
            return cell
        }
        else {
            let cell = UITableViewCell()
            return cell
        }
        
        
    }
    

    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        table_2.isHidden = true
        discountTitle.isHidden = true
        
        if let csvFileURL = Bundle.main.path(forResource: "free", ofType: "csv") {
            
            let stream = InputStream(fileAtPath: csvFileURL)!
            let csv = try! CSVReader(stream: stream)
            while let row = csv.next() {

                freeArray.append(FreeModel(name: row[0], quantity: row[1], price: row[2]))

            }
            
    
        }
        
        if let discount_csvFileURL = Bundle.main.path(forResource: "discount", ofType: "csv") {
            
            let stream = InputStream(fileAtPath: discount_csvFileURL)!
            let csv = try! CSVReader(stream: stream)
            
            while let row = csv.next() {
     
                discountArray.append(DiscountModel(name: row[0], quantity_1: row[1], price_1: row[2], quantity_2: row[3], price_2: row[4]))
               
            
            }
            
            
        }
        
        

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func showFree(_ sender: Any) {
        
        freeBtn.backgroundColor = UIColor(red: 0/255.0, green: 171.0/255.0, blue: 191.0/255.0, alpha: 1.0)
        freeBtn.setTitleColor( UIColor(red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 1.0), for: .normal)
        discountBtn.backgroundColor = UIColor(red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 1.0)
        discountBtn.setTitleColor( UIColor(red: 0/255.0, green: 171.0/255.0, blue: 191.0/255.0, alpha: 1.0), for: .normal)
        
        
        table_2.isHidden = true
        table_1.isHidden = false
        freeTitle.isHidden = false
        discountTitle.isHidden = true
        
        
    }
    @IBAction func showDiscount(_ sender: Any) {
        
        freeBtn.backgroundColor = UIColor(red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 1.0)
        freeBtn.setTitleColor( UIColor(red: 0/255.0, green: 171.0/255.0, blue: 191.0/255.0, alpha: 1.0), for: .normal)
        discountBtn.backgroundColor = UIColor(red: 0/255.0, green: 171.0/255.0, blue: 191.0/255.0, alpha: 1.0)
        discountBtn.setTitleColor( UIColor(red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 1.0), for: .normal)
        
        
        table_2.isHidden = false
        table_1.isHidden = true
        freeTitle.isHidden = true
        discountTitle.isHidden = false
        
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
