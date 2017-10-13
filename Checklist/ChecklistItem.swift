//
//  ChecklistItem.swift
//  Checklist
//
//  Created by Aleksey Kabishau on 1011..17.
//  Copyright © 2017 Dreamline. All rights reserved.
//

import Foundation

class ChecklistItem {
    
    var text = ""
    var checked = false
    
    func toggle() {
        checked = !checked
    }
}
