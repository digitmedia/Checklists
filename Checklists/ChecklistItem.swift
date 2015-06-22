//
//  ChecklistItem.swift
//  Checklists
//
//  Created by Luc Peeters on 26/05/15.
//  Copyright (c) 2015 Digitmedia. All rights reserved.
//

import Foundation

class ChecklistItem: NSObject {
    var text = ""
    var checked = false
    
    func toggleChecked() {
        checked = !checked
    }
}
