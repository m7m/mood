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

class SetupViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var incomeTableView: UITableView!
    @IBOutlet weak var expenseTableView: UITableView!

    
    // MARK: Properties
    var expenseItems = [Expense]()
    var incomeItems = [Income]()
    var moc:NSManagedObjectContext!
    var appDelegate = UIApplication.shared.delegate as? AppDelegate
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        moc = appDelegate?.persistentContainer.viewContext
        self.expenseTableView.dataSource = self
        self.incomeTableView.dataSource = self
        
        incomeTableView.separatorStyle = .none
        expenseTableView.separatorStyle = .none

        loadData()
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        loadData()
    }
    
    
    func loadData() {
        //1
        let expenseRequest: NSFetchRequest<Expense> = Expense.fetchRequest()
        let incomeRequest: NSFetchRequest<Income> = Income.fetchRequest()
        
        //2
        let sortDescriptor = NSSortDescriptor(key: "value", ascending: false)
        expenseRequest.sortDescriptors = [sortDescriptor]
        incomeRequest.sortDescriptors = [sortDescriptor]
        
        //3
        do {
            try expenseItems = moc.fetch(expenseRequest)
        } catch {
            print("Could not load expense data")
        }
        
        do {
            try incomeItems = moc.fetch(incomeRequest)
        } catch {
            print("Could not load income data")
        }
        
        //4
        self.incomeTableView.reloadData()
        self.expenseTableView.reloadData()
    }
    
    @IBAction func addIncomeToDatabase(_ sender: UIButton) {
        let incomeItem = Income(context: moc)
        incomeItem.value = Double()
        incomeItem.name = String()
        
        appDelegate?.saveContext()
        loadData()
    }
    
    
    @IBAction func addExpenseToDatabase(_ sender: UIButton) {

        let expenseItem = Expense(context: moc)
        expenseItem.value = Double()
        expenseItem.name = String()
        
        appDelegate?.saveContext()
        loadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (tableView.tag == 2) {
            return incomeItems.count
        } else if (tableView.tag == 1) {
            return expenseItems.count
        } else {
            return 0
        }
    }
    
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if (tableView.tag == 2) {
            print("tag 2")
        //Step 1: Dequeue the cell
        let cell = tableView.dequeueReusableCell(withIdentifier:"IncomeCell", for: indexPath) as! IncomeTableViewCell
        
        //Step 2: Fetch model objects to display
        let incomeItem = incomeItems[indexPath.row]
        
        //Step 3: Configure cell
        let incomeName = incomeItem.name
        let incomeValue = incomeItem.value
        cell.incomeNameTF?.text = incomeName
        cell.incomeValueTF?.text = "\(incomeValue)"
        
        //Step 4: Return cell
        return cell
            
        } else if (tableView.tag == 1) {
            print("tag 1")
            //Step 1: Dequeue the cell
            let cell = tableView.dequeueReusableCell(withIdentifier:"ExpenseCell", for: indexPath) as! ExpenseTableViewCell
            
            //Step 2: Fetch model objects to display
            let expenseItem = expenseItems[indexPath.row]
            
            //Step 3: Configure cell
            let expenseName = expenseItem.name
            let expenseValue = expenseItem.value
            cell.expenseNameTF?.text = expenseName
            cell.expenseValueTF?.text = "\(expenseValue)"
            
            //Step 4: Return cell
            return cell
            
            
        } else {
            print("no tag")
            let cell = tableView.dequeueReusableCell(withIdentifier:"Cell", for: indexPath) as! IncomeTableViewCell
            return cell
        }
    }
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            if (tableView.tag == 1) {
                let expense = expenseItems[indexPath.row]
                context.delete(expense)
                (UIApplication.shared.delegate as! AppDelegate).saveContext()
                
                do {
                    expenseItems = try context.fetch(Expense.fetchRequest())
                }
                catch {
                    print("Fetching Failed")
                }
            } else if (tableView.tag == 2) {
                let income = incomeItems[indexPath.row]
                context.delete(income)
                (UIApplication.shared.delegate as! AppDelegate).saveContext()
                
                do {
                    incomeItems = try context.fetch(Income.fetchRequest())
                }
                catch {
                    print("Fetching Failed")
                }
            }
        }
        loadData()
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
