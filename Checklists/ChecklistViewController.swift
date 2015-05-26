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
    
    // Add instance variables for the state of the checkmark for each row
    var row0checked = false
    var row1checked = false
    var row2checked = false
    var row3checked = false
    var row4checked = false

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
        
        configureCheckmarkForCell(cell, indexPath: indexPath)
        
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
            
            if let cell = tableView.cellForRowAtIndexPath(indexPath) {
               // Tapping/Selecting a cell toggles the checkmark for that indexPath
               if indexPath.row == 0 {
                 row0checked = !row0checked
               } else if indexPath.row == 1 {
                 row1checked = !row1checked
              } else if indexPath.row == 2 {
                 row2checked = !row2checked
              } else if indexPath.row == 3 {
                 row3checked = !row3checked
              } else if indexPath.row == 4 {
                 row4checked = !row4checked
              }
            
              configureCheckmarkForCell(cell, indexPath: indexPath)
            }
    
            // Cell does not remain selected (grey) when tapped
            tableView.deselectRowAtIndexPath(indexPath, animated: true)
            }
    
    func configureCheckmarkForCell(cell: UITableViewCell, indexPath: NSIndexPath) {
                
                var isChecked = false
                
                if indexPath.row == 0 {
                    isChecked = row0checked
                } else if indexPath == 1 {
                    isChecked = row1checked
                } else if indexPath == 2 {
                    isChecked = row2checked
                } else if indexPath == 3 {
                    isChecked = row3checked
                } else if indexPath == 4 {
                    isChecked = row4checked
                }
                
                if isChecked {
                    cell.accessoryType = .Checkmark
                } else {
                    cell.accessoryType = .None
                }
    }
}