//
//  ViewController.swift
//  Checklist
//
//  Created by Aleksey Kabishau on 1010..17.
//  Copyright © 2017 Dreamline. All rights reserved.
//

import UIKit

class ChecklistViewController: UITableViewController {
    
    var row0Item: ChecklistItems
    var row1Item: ChecklistItems
    var row2Item: ChecklistItems
    var row3Item: ChecklistItems
    var row4Item: ChecklistItems
    
    required init?(coder aDecoder: NSCoder) {
        row0Item = ChecklistItems()
        row0Item.text = "Walk the dog"
        row0Item.checked = false
        
        row1Item = ChecklistItems()
        row1Item.text = "Brush my teeth"
        row1Item.checked = false
        
        row2Item = ChecklistItems()
        row2Item.text = "Learn iOS Development"
        row2Item.checked = false
        
        row3Item = ChecklistItems()
        row3Item.text = "Soccer practice"
        row3Item.checked = false
        
        row4Item = ChecklistItems()
        row4Item.text = "Eat ice cream"
        row4Item.checked = false
        
        super.init(coder: aDecoder)
        
    }


    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //
        if let cell = tableView.cellForRow(at: indexPath) {
            
            // selecting and unselecting the cell depending on current state
            if indexPath.row == 0 {
                // changing the value of variable to oppocite every time the row is clicked
                row0Item.checked = !row0Item.checked
            }
            
            if indexPath.row == 1 {
                row1Item.checked = !row1Item.checked
            }
            
            if indexPath.row == 2 {
                row2Item.checked = !row2Item.checked
            }
            
            if indexPath.row == 3 {
                row3Item.checked = !row3Item.checked
            }
            
            if indexPath.row == 4 {
                row4Item.checked = !row4Item.checked
            }
            
            configureCheckmark(for: cell, at: indexPath)
        }

        // removing highlighting the selected cell
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChecklistItem", for: indexPath)
        
        // creating label with specific tag
        let label = cell.viewWithTag(1000) as! UILabel
        
        
        switch indexPath.row {
        case 0:
            label.text = row0Item.text
        case 1:
            label.text = row1Item.text
        case 2:
            label.text = row2Item.text
        case 3:
            label.text = row3Item.text
        case 4:
            label.text = row4Item.text
        default:
            label.text = ""
        }
        
        configureCheckmark(for: cell, at: indexPath)
        
        return cell
    }
    
    // method solves the issue of appearance of checkmarks by default
    func configureCheckmark(for cell: UITableViewCell, at indexPath: IndexPath) {
        var isChecked = false
        
        if indexPath.row == 0 {
            isChecked = row0Item.checked
        } else if indexPath.row == 1 {
            isChecked = row1Item.checked
        } else if indexPath.row == 2 {
            isChecked = row2Item.checked
        } else if indexPath.row == 3 {
            isChecked = row3Item.checked
        } else if indexPath.row == 4 {
            isChecked = row4Item.checked
        }
        
        if isChecked {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
    }

}
