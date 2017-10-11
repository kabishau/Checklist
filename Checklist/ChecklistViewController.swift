//
//  ViewController.swift
//  Checklist
//
//  Created by Aleksey Kabishau on 1010..17.
//  Copyright © 2017 Dreamline. All rights reserved.
//

import UIKit

class ChecklistViewController: UITableViewController {
    
    var row0text = "Walk the dog"
    var row1text = "Brush my teeth"
    var row2text = "Learn iOS Development"
    var row3text = "Soccer practice"
    var row4text = "Eat ice cream"
    var row0Checked = false
    var row1Checked = false
    var row2Checked = false
    var row3Checked = false
    var row4Checked = false

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //
        if let cell = tableView.cellForRow(at: indexPath) {
            
            // selecting and unselecting the cell depending on current state
            if indexPath.row == 0 {
                // changing the value of variable to oppocite every time the row is clicked
                row0Checked = !row0Checked
            }
            
            if indexPath.row == 1 {
                row1Checked = !row1Checked
            }
            
            if indexPath.row == 2 {
                row2Checked = !row2Checked
            }
            
            if indexPath.row == 3 {
                row3Checked = !row3Checked
            }
            
            if indexPath.row == 4 {
                row4Checked = !row4Checked
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
            label.text = row0text
        case 1:
            label.text = row1text
        case 2:
            label.text = row2text
        case 3:
            label.text = row3text
        case 4:
            label.text = row4text
        default:
            label.text = "Sleep"
        }
        
        configureCheckmark(for: cell, at: indexPath)
        
        return cell
    }
    
    // method solves the issue of appearance of checkmarks by default
    func configureCheckmark(for cell: UITableViewCell, at indexPath: IndexPath) {
        var isChecked = false
        
        if indexPath.row == 0 {
            isChecked = row0Checked
        } else if indexPath.row == 1 {
            isChecked = row1Checked
        } else if indexPath.row == 2 {
            isChecked = row2Checked
        } else if indexPath.row == 3 {
            isChecked = row3Checked
        } else if indexPath.row == 4 {
            isChecked = row4Checked
        }
        
        if isChecked {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
    }

}
