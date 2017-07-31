//
//  MonthliesTableViewController.swift
//  Baisti
//
//  Created by Mahmood al-Zadjali on 31/07/2017.
//  Copyright © 2017 Mahmood al-Zadjali. All rights reserved.
//

import UIKit

class MonthliesTableViewController: UITableViewController {

    //MARK: Properties
    
    var expenses = [Expenses]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let savedExpenses = loadFromFile() {
            expenses += savedExpenses
            print("Shay minni")
        } else {
            loadSampleExpenses()
            print("Naatttiiin")
        }

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return expenses.count
        } else {
            return 0
        }
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "monthlySetupCell", for: indexPath) as! MonthliesTableViewCell

        // Configure the cell...
        let expense = expenses[indexPath.row]
        
        cell.update(with: expense)

        return cell
    }
    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    
    // MARK: - Navigation

    
    // MARK: Private Methods
    private func loadSampleExpenses() {
        let sampleExpenses: [Expenses] = [Expenses(expenseName:"Food", expenseValue: 300), Expenses(expenseName:"Petrol", expenseValue: 50), Expenses(expenseName:"Mobile", expenseValue: 25), Expenses(expenseName:"Shopping", expenseValue: 100)]
        expenses = sampleExpenses
    }
    
    // MARK: Load Function
    private func loadFromFile() -> [Expenses]? {
        print("boo")
        return NSKeyedUnarchiver.unarchiveObject(withFile: Expenses.archiveURL.path) as? [Expenses]
    }
}
