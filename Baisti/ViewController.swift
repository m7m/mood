//
//  ViewController.swift
//  Baisti
//
//  Created by Mahmood al-Zadjali on 23/07/2017.
//  Copyright © 2017 Mahmood al-Zadjali. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        // Do any additional setup after loading the view, typically from a nib.
        calculateMonthlies()
    }
    
    @IBOutlet weak var preIncome: UITextField!
    @IBOutlet weak var Income: UILabel!
    @IBOutlet weak var Dailies: UILabel!
    
    let DecimalOMR = 3
    
    @IBAction func change(_ sender: Any) {
        if preIncome.text != nil && preIncome.text != "" {
            let preTaxIncomeText = preIncome.text!
            let preTaxIncome: Double = Double(preTaxIncomeText)!
            let realIncome: Double = Double(preTaxIncome) * (0.93)
            
            func getCurrencyFormat(amount: Double) -> NSString
            {
                let amountFormatter = NumberFormatter()
                amountFormatter.numberStyle = .currency
                amountFormatter.locale = NSLocale.system
                return amountFormatter.string(from: amount as NSNumber)! as NSString
            }
            
            Income.text = getCurrencyFormat(amount: realIncome) as String
            Dailies.text = "\(realIncome/31)"
        } else {
            preIncome.text = nil
            Income.text = nil
            Dailies.text = nil
        }
    }

    
    // MARK: OUTPUT Monthlies
    @IBOutlet weak var monthlyExpenses: UILabel!
    var list: Array = ["Food","Education","Clothing"]
    let sublist: Array = [300.000, 120.000,83.333]
    
    func calculateMonthlies () {
        let addTwo: (Double, Double) -> Double = { x, y in x + y }
        let sublistSum = sublist.reduce(0, addTwo)
        monthlyExpenses.text = "\(sublistSum)"
    }


    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return(list.count)
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .value1, reuseIdentifier: "cell")
        cell.textLabel?.text = list[indexPath.row]
        cell.detailTextLabel?.text = "\(sublist[indexPath.row])"
        
        return (cell)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
