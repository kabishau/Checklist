//
//  ViewController.swift
//  Checklist
//
//  Created by Aleksey Kabishau on 1010..17.
//  Copyright © 2017 Dreamline. All rights reserved.
//

import UIKit

class ChecklistViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //
        if let cell = tableView.cellForRow(at: indexPath) {
            // selecting and unselecting the cell depending on current state
            if cell.accessoryType == .none {
                cell.accessoryType = .checkmark
            } else {
                cell.accessoryType = .none
            }
        }

        // removing highlighting the selected cell
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChecklistItem", for: indexPath)
        
        // creating label with specific tag
        let label = cell.viewWithTag(1000) as! UILabel
        
        
        switch indexPath.row % 5 {
        case 0:
            label.text = "Walk the dog"
        case 1:
            label.text = "Brush my teeth"
        case 2:
            label.text = "Learn iOS Development"
        case 3:
            label.text = "Soccer practice"
        case 4:
            label.text = "Eat ice cream"
        default:
            label.text = "Sleep"
        }
        

        return cell
        
    }

}
