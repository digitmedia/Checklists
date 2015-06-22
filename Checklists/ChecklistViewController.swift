//
//  ChecklistViewController.swift
//  Checklists
//
//  Created by Luc Peeters on 24/05/15.
//  Copyright (c) 2015 Digitmedia. All rights reserved.
//

import UIKit

class ChecklistViewController: UITableViewController, ItemDetailViewControllerDelegate {
    
    // This declares that 'items' will hold an array of ChecklistItem objects 
    // but it does not actually create that array.
    // At this point, var 'items' does not have a value yet.
    
    var items: [ChecklistItem]
    
    // If you can’t give the variable a value right away when you declare it, then you have to give it a value inside a so-called initializer method.
    
    required init(coder aDecoder: NSCoder) {
        // This instantiates the array. Now items contains a valid array object,
        // but the array has no ChecklistItem objects inside it yet.
        
        items = [ChecklistItem]()
        
        // This instantiates a new ChecklistItem object. Notice the ().
        
        let row0item = ChecklistItem()
        row0item.text = "Walk the dog"
        row0item.checked = false
        // This adds the ChecklistItem object into the items array.
        items.append(row0item)
        
        let row1item = ChecklistItem()
        row1item.text = "Brush my teeth"
        row1item.checked = true
        items.append(row1item)
        
        let row2item = ChecklistItem()
        row2item.text = "Learn iOS development"
        row2item.checked = true
        items.append(row2item)
        
        let row3item = ChecklistItem()
        row3item.text = "Soccer practice"
        row3item.checked = false
        items.append(row3item)
        
        let row4item = ChecklistItem()
        row4item.text = "Eat ice cream"
        row4item.checked = true
        items.append(row4item)
        
        let row5item = ChecklistItem()
        row5item.text = "To Do number 5"
        row5item.checked = false
        items.append(row5item)
        
        let row6item = ChecklistItem()
        row6item.text = "To Do number 6"
        row6item.checked = false
        items.append(row6item)
        
        super.init(coder: aDecoder) }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    // When user selects a row, the checkmark is toggled
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if let cell = tableView.cellForRowAtIndexPath(indexPath) {
            let item = items[indexPath.row]
            item.toggleChecked()
            
            configureCheckmarkForCell(cell, withChecklistItem: item)
        }
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Return the number of Rows to the UITableView object
        return items.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    
        // Return the label value for a specific indexPath row number
        let cell = tableView.dequeueReusableCellWithIdentifier("ChecklistItem")
                            as! UITableViewCell
            
        let item = items[indexPath.row]
        
        configureTextForCell(cell, withChecklistItem: item)
        configureCheckmarkForCell(cell, withChecklistItem: item)
        
        return cell
    }
    
    // Slide left to delete row - using deleteRowsAtIndexPaths
    override func tableView(tableView: UITableView,
        commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        items.removeAtIndex(indexPath.row)
        let indexPaths = [indexPath]
        tableView.deleteRowsAtIndexPaths(indexPaths, withRowAnimation: .Automatic)
        }
    
    // Tell ItemDetailViewController that ChecklistViewController is its delegate `ItemDetailViewControllerDelegate`when performing the segue
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "AddItem" {
            let navigationController = segue.destinationViewController as! UINavigationController
            let controller = navigationController.topViewController as! ItemDetailViewController
            controller.delegate = self
        } else if segue.identifier == "EditItem" {
            let navigationController = segue.destinationViewController as! UINavigationController
            let controller = navigationController.topViewController as! ItemDetailViewController
            controller.delegate = self
            if let indexPath = tableView.indexPathForCell(sender as! UITableViewCell) {
                controller.itemToEdit = items[indexPath.row]
            }
        }
    }

    // The text label of a cell is retrieved for a specific ChecklistItem
    func configureTextForCell(cell: UITableViewCell, withChecklistItem item: ChecklistItem) {
        let label = cell.viewWithTag(1000) as! UILabel
        label.text = item.text
    }
    
    // If an item is checked, a label with a Checkmark-character is shown in the corresponding cell
    func configureCheckmarkForCell(cell: UITableViewCell, withChecklistItem item: ChecklistItem) {
        let label = cell.viewWithTag(1001) as! UILabel
        
        if item.checked {
            label.text = "✓"
        } else {
            label.text = ""
        }
    }
    
    // 1st Delegate Protocol Method: 'DidCancel'
    func itemDetailViewControllerDidCancel(controller: ItemDetailViewController) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    // 2nd Delegate Protocol Method: 'didFinishAddingItem'
    func itemDetailViewController(controller: ItemDetailViewController, didFinishAddingItem item: ChecklistItem) {
        // Add the new  ChecklistItem object (created in ItemDetailViewController) to the data model and table view (by appending `item` to the end of the array `items = [ChecklistItem]`
        let newRowIndex = items.count
        
        items.append(item) // item is a new ChecklistItem object, created in ItemDetailViewController
        
        // Tell the TableView about the new row, so it can add a new row for it - using insertRowsAtIndexPaths
        let indexPath = NSIndexPath(forRow: newRowIndex, inSection: 0)
        let indexPaths = [indexPath]
        tableView.insertRowsAtIndexPaths(indexPaths, withRowAnimation: .Automatic)
        
        // Close the AddItem screen & return to Checklists screen
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    // 3rd Delegate Protocol Method: didFinishEditingItem
    
    func itemDetailViewController(controller: ItemDetailViewController,
                                            didFinishEditingItem item: ChecklistItem) {
        if let index = find(items, item) {
            let indexPath = NSIndexPath(forRow: index, inSection: 0)
        if let cell = tableView.cellForRowAtIndexPath(indexPath) {
            configureTextForCell(cell, withChecklistItem: item) }
        }
        dismissViewControllerAnimated(true, completion: nil)
    }
}


