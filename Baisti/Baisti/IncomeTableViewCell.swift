//
//  IncomeTableViewCell.swift
//  Baisti
//
//  Created by Mahmood al-Zadjali on 04/08/2017.
//  Copyright © 2017 Mahmood al-Zadjali. All rights reserved.
//

import UIKit
import CoreData

class IncomeTableViewCell: UITableViewCell {

    var moc: NSManagedObjectContext!
    
    @IBOutlet weak var incomeNameTF: UITextField!
    @IBOutlet weak var incomeValueTF: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    
    @IBAction func saveData(_ sender: UITextField) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let income = Income(context: context)
        
        if incomeNameTF.text != "" && incomeValueTF.description != "" {
            income.name = incomeNameTF.text!
            let test = incomeValueTF.text
            let testDouble = Double(test!)
            income.value = testDouble!
            
            (UIApplication.shared.delegate as! AppDelegate).saveContext()
        } else {
            print("OOPS!")
        }
    }
}
