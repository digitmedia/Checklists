//
//  ChecklistViewController.swift
//  Checklists
//
//  Created by Luc Peeters on 24/05/15.
//  Copyright (c) 2015 Digitmedia. All rights reserved.
//

import UIKit

class ChecklistViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    
        let cell = tableView.dequeueReusableCellWithIdentifier("ChecklistItem")
        as! UITableViewCell
        
        let label = cell.viewWithTag(1000) as! UILabel
        
        if indexPath.row == 0 {
            label.text = "Hond uitlaten"
        } else if indexPath.row == 1 {
            label.text = "Kat binnenlaten"
        } else if indexPath.row == 2 {
            label.text = "iOS leren"
        } else if indexPath.row == 3 {
            label.text = "Boodschappen doen"
        } else if indexPath.row == 4{
            label.text = "banden oppompen"
        }
        
        return cell
    }
}

