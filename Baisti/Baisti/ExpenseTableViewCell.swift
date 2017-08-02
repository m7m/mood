//
//  ExpenseTableViewCell.swift
//  Baisti
//
//  Created by Mahmood al-Zadjali on 02/08/2017.
//  Copyright © 2017 Mahmood al-Zadjali. All rights reserved.
//

import UIKit

class ExpenseTableViewCell: UITableViewCell {

    @IBOutlet weak var expenseNameTF: UITextField!
    
    @IBOutlet weak var expenseValueTF: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
