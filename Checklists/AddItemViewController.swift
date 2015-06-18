//
//  AddItemViewController.swift
//  Checklists
//
//  Created by Luc Peeters on 18/06/15.
//  Copyright (c) 2015 Digitmedia. All rights reserved.
//

import UIKit

class AddItemViewController: UITableViewController, UITextViewDelegate {
    
    @IBAction func cancel(sender: UIBarButtonItem) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func done() {
        println("Contents of the text field: \(textField.text)")
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    // Disallow the table view to select a row
    override func tableView(tableView: UITableView, willSelectRowAtIndexPath indexPath: NSIndexPath) -> NSIndexPath? {
        return nil
    }
    
    // Make the text field active when the Add Item scene appears - so that the keyboard appears automatically
    // Giving the (text field) control focus = the control becomes the first responder
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        textField.becomeFirstResponder()
    }
    
    // Disable doneBarBurtton when text field is empty
    // One of the UITextFiled delegate methods, invoked every time the user changes the text
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        // Figure out what the new text will be
        let oldText: NSString = textField.text
        let newText: NSString = oldText.stringByReplacingCharactersInRange(range, withString: string)
        
        // check if the new text is empty by looking at its length, and enable or disable the Done button accordingly:
        doneBarButton.enabled = (newText.length > 0) // Swift comparison operators all return true or false
        return true
    }
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var doneBarButton: UIBarButtonItem!
}
