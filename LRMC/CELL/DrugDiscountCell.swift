//
//  DrugDiscountCell.swift
//  LRMC
//
//  Created by ujs on 11/24/19.
//  Copyright © 2019 Marko Dreher. All rights reserved.
//

import UIKit

class DrugDiscountCell: UITableViewCell {
    
    

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var quan_1: UILabel!
    @IBOutlet weak var pay_1: UILabel!
    @IBOutlet weak var quan_2: UILabel!
    @IBOutlet weak var pay_2: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
