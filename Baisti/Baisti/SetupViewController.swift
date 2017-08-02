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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return 0
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //Step 1: Dequeue the cell
        let cell = tableView.dequeueReusableCell(withIdentifier:"IncomeCell", for: indexPath)
        
        //Step 2: Fetch model objects to display

        
        //Step 3: Configure cell

        
        //Step 4: Return cell
        return cell
    }


    func tableView(_ tableView: UITableView, moveRowAt indexPath: IndexPath, to: IndexPath) {
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCellEditingStyle {
        return .delete
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
    }

}
