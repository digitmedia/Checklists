//
//  ChecklistViewController.swift
//  Checklists
//
//  Created by Luc Peeters on 24/05/15.
//  Copyright (c) 2015 Digitmedia. All rights reserved.
//

import UIKit

class ChecklistViewController: UITableViewController {
    
    // Add instance variables with the text for that row
    var row0text = "Walk the dog"
    var row1text = "Brush teeth"
    var row2text = "Learn iOS development"
    var row3text = "Sailing practice"
    var row4text = "Take a break"

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Return the number of Rows to the UITableView object
        return 5
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    
        // Return the label value for a specific indexPath row number
        let cell = tableView.dequeueReusableCellWithIdentifier("ChecklistItem")
        as! UITableViewCell
        
        let label = cell.viewWithTag(1000) as! UILabel
        
        if indexPath.row == 0 {
            label.text = row0text
        } else if indexPath.row == 1 {
            label.text = row1text
        } else if indexPath.row == 2 {
            label.text = row2text
        } else if indexPath.row == 3 {
            label.text = row3text
        } else if indexPath.row == 4{
            label.text = row4text
        }
        
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
            
            // Tapping/Selecting a cell toggles the checkmark
            if let cell = tableView.cellForRowAtIndexPath(indexPath) {
                if cell.accessoryType == .None {
                    cell.accessoryType = .Checkmark
                } else {
                    cell.accessoryType = .None
                }
            }
            
            // Cell does not remain selected (grey) when tapped
            tableView.deselectRowAtIndexPath(indexPath, animated: true)

    }
    

}

