//
//  DrugFreeCell.swift
//  LRMC
//
//  Created by ujs on 11/24/19.
//  Copyright © 2019 Marko Dreher. All rights reserved.
//

import UIKit

class DrugFreeCell: UITableViewCell {

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var quantity: UILabel!
    @IBOutlet weak var pay: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
