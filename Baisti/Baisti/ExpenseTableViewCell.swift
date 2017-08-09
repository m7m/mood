//
//  ExpenseTableViewCell.swift
//  Baisti
//
//  Created by Mahmood al-Zadjali on 02/08/2017.
//  Copyright © 2017 Mahmood al-Zadjali. All rights reserved.
//

import UIKit
import CoreData

class ExpenseTableViewCell: UITableViewCell {

    var moc:NSManagedObjectContext!
    
    @IBOutlet weak var expenseNameTF: UITextField!
    @IBOutlet weak var expenseValueTF: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    
    @IBAction func saveData(_ sender: UITextField) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let expense = Expense(context: context)
        
        if expenseNameTF.text != "" && expenseValueTF.description != "" {
            expense.name = expenseNameTF.text!
            let test = expenseValueTF.text
            let testDouble = Double(test!)
            expense.value = testDouble!
            
            (UIApplication.shared.delegate as! AppDelegate).saveContext()
        } else {
            print("OOPS!")
        }
    }
}
