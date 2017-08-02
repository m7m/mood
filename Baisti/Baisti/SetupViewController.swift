//
//  SetupViewController.swift
//  Baisti
//
//  Created by Mahmood al-Zadjali on 01/08/2017.
//  Copyright © 2017 Mahmood al-Zadjali. All rights reserved.
//

import UIKit
import CoreData
import os.log

class SetupViewController: UIViewController, UITableViewDataSource {

    @IBOutlet weak var expenseTableView: UITableView!

    
    // MARK: Properties
    var expenseItems = [Expense]()
    var moc:NSManagedObjectContext!
    var appDelegate = UIApplication.shared.delegate as? AppDelegate
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        moc = appDelegate?.persistentContainer.viewContext
        self.expenseTableView.dataSource = self
        
        loadData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        loadData()
    }
    
    func loadData() {
        //1
        let expenseRequest:NSFetchRequest<Expense> = Expense.fetchRequest()
        
        //2
        let sortDescriptor = NSSortDescriptor(key: "value", ascending: false)
        expenseRequest.sortDescriptors = [sortDescriptor]
        
        //3
        do {
            try expenseItems = moc.fetch(expenseRequest)
        } catch {
            print("Could not load data")
        }
        
        //4
        self.expenseTableView.reloadData()
    }

    @IBAction func addExpenseToDatabase(_ sender: UIButton) {
        let expenseItem = Expense(context: moc)
        expenseItem.value = Double()
        expenseItem.name = String()
        
        appDelegate?.saveContext()
        
        loadData()

    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return expenseItems.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //Step 1: Dequeue the cell
        let cell = tableView.dequeueReusableCell(withIdentifier:"Cell", for: indexPath) as! ExpenseTableViewCell
        
        //Step 2: Fetch model objects to display
        let expenseItem = expenseItems[indexPath.row]
        
        //Step 3: Configure cell
        let expenseName = expenseItem.name
        let expenseValue = expenseItem.value
        cell.expenseNameTF?.text = expenseName
        cell.expenseValueTF?.text = "\(expenseValue)"
        
        //Step 4: Return cell
        return cell
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
