//
//  ViewController.swift
//  Checklist
//
//  Created by Aleksey Kabishau on 1010..17.
//  Copyright © 2017 Dreamline. All rights reserved.
//

import UIKit

class ChecklistViewController: UITableViewController, AddItemViewControllerDelegate {
    
    func addItemViewControllerDidCancel(_ controller: AddItemTableViewController) {
        navigationController?.popViewController(animated: true)
    }
    
    func addItemViewController(_ controller: AddItemTableViewController, didFinishAdding item: ChecklistItem) {
        
        let newRowIndex = items.count
        items.append(item)
        let indexPath = IndexPath(row: newRowIndex, section: 0)
        let indexPaths = [indexPath]
        tableView.insertRows(at: indexPaths, with: .automatic)
        navigationController?.popViewController(animated: true)
    }
    
    func addItemViewController(_ controller: AddItemTableViewController, didFinishEditing item: ChecklistItem) {
        
        // take advantage of NSObject
        // grabing index of selected row
        if let index = items.index(of: item) {
            let indexPath = IndexPath(row: index, section: 0)
            // grabing cell
            if let cell = tableView.cellForRow(at: indexPath) {
                configureText(for: cell, with: item)
            }
        }
        navigationController?.popViewController(animated: true)
        
        
    }
    

    
    var items: [ChecklistItem]
    
    @IBAction func addItem(_ sender: Any) {
        
        let titles = ["New1", "New2", "New3", "New4", "New5"]
        let randomNumber = Int(arc4random_uniform(UInt32(titles.count)))
        
        
        // index of the new item
        let newRowIndex = items.count
        
        // instance of the new item, properties and adding to array
        let item = ChecklistItem()
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
        items = [ChecklistItem]()
        
        let row0Item = ChecklistItem()
        row0Item.text = "Walk the dog"
        row0Item.checked = false
        items.append(row0Item)
        
        
        let row1Item = ChecklistItem()
        row1Item.text = "Brush my teeth"
        row1Item.checked = false
        items.append(row1Item)
        
        let row2Item = ChecklistItem()
        row2Item.text = "Learn iOS Development"
        row2Item.checked = false
        items.append(row2Item)
        
        let row3Item = ChecklistItem()
        row3Item.text = "Soccer practice"
        row3Item.checked = false
        items.append(row3Item)
        
        let row4Item = ChecklistItem()
        row4Item.text = "Eat ice cream"
        row4Item.checked = false
        items.append(row4Item)
        
        let row5Item = ChecklistItem()
        row5Item.text = "Learn NSCoder"
        row5Item.checked = false
        items.append(row5Item)
        
        let row6Item = ChecklistItem()
        row6Item.text = "Learn Unity"
        row6Item.checked = true
        items.append(row6Item)
        
        let row7Item = ChecklistItem()
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
    
    // called every time when seque is affected
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddItem" {
            let controller = segue.destination as! AddItemTableViewController
            controller.delegate = self
        } else if segue.identifier == "EditItem" {
            let controller = segue.destination as! AddItemTableViewController
            controller.delegate = self
            
            if let indexPath = tableView.indexPath(for: sender as! UITableViewCell) {
                controller.itemToEdit = items[indexPath.row]
            }
        }
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
    
    func configureText(for cell: UITableViewCell, with item: ChecklistItem) {
        
        // creating label with specific tag using downcasting
        let label = cell.viewWithTag(1000) as! UILabel
        label.text = item.text
    }
    
    // define the appearance of the checkmark depending on item property .checked
    
    func configureCheckmark(for cell: UITableViewCell, with item: ChecklistItem) {
        
        let label = cell.viewWithTag(1001) as! UILabel

        if item.checked {
            label.text = "√"
        } else {
            label.text = ""
        }
    }
    


}
