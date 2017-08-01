//
//  CurrentMonthViewController.swift
//  Baisti
//
//  Created by Mahmood al-Zadjali on 30/07/2017.
//  Copyright © 2017 Mahmood al-Zadjali. All rights reserved.
//

import UIKit

class CurrentMonthViewController: UIViewController {
    @IBOutlet weak var currentMonthLabel: UILabel!
    
    func updateMonth() {
        let now = NSDate()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM"
        let nameOfMonth = dateFormatter.string(from: now as Date).uppercased()
        currentMonthLabel.text = nameOfMonth
    }

    @IBOutlet weak var updateMe: UILabel!

    var setupSalary = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateMe.text = setupSalary
        
        updateMonth()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
