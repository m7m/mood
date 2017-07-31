//
//  MonthliesTableViewCell.swift
//  Baisti
//
//  Created by Mahmood al-Zadjali on 31/07/2017.
//  Copyright © 2017 Mahmood al-Zadjali. All rights reserved.
//

import UIKit

class MonthliesTableViewCell: UITableViewCell {

    @IBOutlet weak var expenseName: UITextField!
    @IBOutlet weak var expenseValue: UITextField!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func update(with expense: Expenses){
        expenseName.text = expense.expenseName
        expenseValue.text = expense.expenseValue
    }
    
}
