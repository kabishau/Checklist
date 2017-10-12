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
    
    @IBAction func addItem(_ sender: Any) {
        
        let titles = ["New1", "New2", "New3", "New4", "New5"]
        let randomNumber = Int(arc4random_uniform(UInt32(titles.count)))
        
        
        // index of the new item
        let newRowIndex = items.count
        
        // instance of the new item, properties and adding to array
        let item = ChecklistItems()
        item.text = titles[randomNumber]
        item.checked = true
        items.append(item)
        
        // indexPath for adding to array indexPaths to determine location of new item
        let indexPath = IndexPath(row: newRowIndex, section: 0)
        let indexPaths = [indexPath]
        
        // inserts new item in defined position
        tableView.insertRows(at: indexPaths, with: .automatic)
        
    }
    
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
        
        // making Navigation Title larger
        navigationController?.navigationBar.prefersLargeTitles = true

    }
    
    // make the row editable (deleting the row from data source
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        items.remove(at: indexPath.row)
        
        // updating UI
        tableView.reloadData()
        
        // alternative method with animation that is not supported in previous step
        //let indexPaths = [indexPath]
        //tableView.deleteRows(at: indexPaths, with: .fade)
        
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
