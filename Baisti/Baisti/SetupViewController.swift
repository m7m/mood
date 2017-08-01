//
//  SetupViewController.swift
//  Baisti
//
//  Created by Mahmood al-Zadjali on 01/08/2017.
//  Copyright © 2017 Mahmood al-Zadjali. All rights reserved.
//

import UIKit
import os.log

class SetupViewController: UIViewController {

    // MARK: Properties
    @IBOutlet weak var incomeNameTF: UITextField!
    @IBOutlet weak var incomeValueTF: UITextField!
    
    var income: Income?
    var incomes = [Income]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let savedIncome = loadFromFile() {
            incomes += savedIncome
            print("incomessss")
        } else {
            loadSampleIncome()
            print("Loaded sample income.")
        }
        
        if let income = income {
            incomeNameTF.text = income.name
            incomeValueTF.text = income.value
        } else {
            print("There's nothing here")
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return incomes.count
        } else {
            return 0
        }
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //Step 1: Dequeue the cell
        let cell = tableView.dequeueReusableCell(withIdentifier:"IncomeCell", for: indexPath)
        
        //Step 2: Fetch model objects to display
        let income = incomes[indexPath.row]
        
        //Step 3: Configure cell
        update(with: income)
        cell.showsReorderControl = true
        
        //Step 4: Return cell
        return cell
    }
    
    func update(with income: Income) {
        incomeNameTF.text = income.name
        incomeValueTF.text = income.value
    }

    func tableView(_ tableView: UITableView, moveRowAt indexPath: IndexPath, to: IndexPath) {
        let movedIncome = incomes.remove(at: indexPath.row)
        incomes.insert(movedIncome, at: to.row)
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCellEditingStyle {
        return .delete
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            incomes.remove(at: indexPath.row)
            saveToFile()
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
//    override func viewWillAppear(_ animated: Bool) {
//        tableView.reloadData()
//    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
            if let destination = segue.destination as? CurrentMonthViewController {
                destination.setupSalary = incomeValueTF.text!
            }

    }
    
    // MARK: Private Methods
    
    private func loadSampleIncome() {
        let sampleIncome: [Income] = [Income(name: "Salary", value: "500")]
        
        incomes = sampleIncome
    }
    
    // MARK: Save Function
    private func saveToFile() {
        let isSuccessfulSave = NSKeyedArchiver.archiveRootObject(incomes, toFile: Income.archiveURL.path)
        if isSuccessfulSave {
            os_log("Income successfully saved", log: OSLog.default, type: .debug)
        } else {
            os_log("Income failed to save", log: OSLog.default, type: .error)
        }
    }
    
    
    // MARK: Load Function
    private func loadFromFile() -> [Income]? {
        print("boo")
        return NSKeyedUnarchiver.unarchiveObject(withFile: Income.archiveURL.path) as? [Income]
    }

}
