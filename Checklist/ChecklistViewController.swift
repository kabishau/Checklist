//
//  ViewController.swift
//  Checklist
//
//  Created by Aleksey Kabishau on 1010..17.
//  Copyright © 2017 Dreamline. All rights reserved.
//

import UIKit

class ChecklistViewController: UITableViewController {
    
    var items: [ChecklistItems]
    
    required init?(coder aDecoder: NSCoder) {
        // initializing array
        items = [ChecklistItems]()
        
        let row0Item = ChecklistItems()
        row0Item.text = "Walk the dog"
        row0Item.checked = false
        items.append(row0Item)
        
        
        let row1Item = ChecklistItems()
        row1Item.text = "Brush my teeth"
        row1Item.checked = false
        items.append(row1Item)
        
        let row2Item = ChecklistItems()
        row2Item.text = "Learn iOS Development"
        row2Item.checked = false
        items.append(row2Item)
        
        let row3Item = ChecklistItems()
        row3Item.text = "Soccer practice"
        row3Item.checked = false
        items.append(row3Item)
        
        let row4Item = ChecklistItems()
        row4Item.text = "Eat ice cream"
        row4Item.checked = false
        items.append(row4Item)
        
        let row5Item = ChecklistItems()
        row5Item.text = "Learn NSCoder"
        row5Item.checked = false
        items.append(row5Item)
        
        let row6Item = ChecklistItems()
        row6Item.text = "Learn Unity"
        row6Item.checked = true
        items.append(row6Item)
        
        let row7Item = ChecklistItems()
        row7Item.text = "Get salary rise"
        row7Item.checked = true
        items.append(row7Item)
        
        super.init(coder: aDecoder)
        
    }


    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let cell = tableView.cellForRow(at: indexPath) {
            
            let item = items[indexPath.row]
            item.toggle()

            configureCheckmark(for: cell, with: item)
        }

        // removing highlighting the selected cell
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChecklistItem", for: indexPath)

        // taking the item from the array
        let item = items[indexPath.row]
        
        configureText(for: cell, with: item)
        configureCheckmark(for: cell, with: item)
        
        return cell
    }
    
    // define the label content depending on selected row and item property .text
    
    func configureText(for cell: UITableViewCell, with item: ChecklistItems) {
        
        // creating label with specific tag using downcasting
        let label = cell.viewWithTag(1000) as! UILabel
        label.text = item.text
    }
    
    // define the appearance of the checkmark depending on item property .checked
    
    func configureCheckmark(for cell: UITableViewCell, with item: ChecklistItems) {

        if item.checked {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
    }

}
