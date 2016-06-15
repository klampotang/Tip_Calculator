//
//  ViewController.swift
//  tippit
//
//  Created by Kelly Lampotang on 6/14/16.
//  Copyright © 2016 Kelly Lampotang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipSegControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        print("view will appear")
        let defaults = NSUserDefaults.standardUserDefaults()
        let tipValue = defaults.integerForKey("default_tip_percentage")
        tipSegControl.selectedSegmentIndex = tipValue
        
        
        let tipPercentages = [0.18, 0.2, 0.3]
        let bill = Double(billField.text!) ?? 0
        let tip = bill * tipPercentages[tipSegControl.selectedSegmentIndex]
        let total = bill + tip
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func yelpButton(sender: AnyObject) {
        if let url = NSURL(string: "http://www.yelp.com") {
            UIApplication.sharedApplication().openURL(url)
        }
    }
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }

    @IBAction func calculateTip(sender: AnyObject) {
        
        let tipPercentages = [0.18, 0.2, 0.3]
        let bill = Double(billField.text!) ?? 0
        let tip = bill * tipPercentages[tipSegControl.selectedSegmentIndex]
        let total = bill + tip
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }
}

