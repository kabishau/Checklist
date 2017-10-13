//
//  AddItemTableViewController.swift
//  Checklist
//
//  Created by Aleksey Kabishau on 1011..17.
//  Copyright © 2017 Dreamline. All rights reserved.
//

import UIKit

// defining the protocol with class only restriction
protocol ItemDetailViewControllerDelegate: class {
    func itemDetailViewControllerDidCancel(_ controller: ItemDetailViewController)
    func itemDetailViewController(_ controller: ItemDetailViewController, didFinishAdding item: ChecklistItem)
    func itemDetailViewController(_ controller: ItemDetailViewController, didFinishEditing item: ChecklistItem)
}

class ItemDetailViewController: UITableViewController, UITextFieldDelegate {
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var cancelBarButton: UIBarButtonItem!
    @IBOutlet weak var doneBarButton: UIBarButtonItem!
    //
    var itemToEdit: ChecklistItem?
    
    
    // creating delegate property
    weak var delegate: ItemDetailViewControllerDelegate?
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.largeTitleDisplayMode = .never
        
        if let item = itemToEdit {
            title = "Edit Item"
            textField.text = item.text
            // makes bar button done enabled again
            doneBarButton.isEnabled = true
        }
        
    }
    

    
    // this makes textField view the first responder
    override func viewWillAppear(_ animated: Bool) {
        textField.becomeFirstResponder()
    }
    
    // this can be done through StoryBoard
//    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        textField.resignFirstResponder()
//        return false
//    }
    
    
    @IBAction func cancel() {
        
        delegate?.itemDetailViewControllerDidCancel(self)
        
    }
    
    @IBAction func done() {
        
        if let itemToEdit = itemToEdit {
            
            itemToEdit.text = textField.text!
            delegate?.itemDetailViewController(self, didFinishEditing: itemToEdit)
            
        } else {
            
            let item = ChecklistItem()
            item.text = textField.text!
            item.checked = false
            delegate?.itemDetailViewController(self, didFinishAdding: item)
        }
        
        
        
    }
    
    // this disables selection of the text field
    // I'm going to select this row. - No, you're not...
    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        return nil
    }
    
    // this is called every time the user types in the text field, it covers copy/paste option in the middle of the function
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        let oldText = textField.text!
        let stringRange = Range(range, in: oldText)
        let newText = oldText.replacingCharacters(in: stringRange!, with: string)
        
        // makes doneBarButton not enabled if field becomes empty
        if newText.isEmpty {
            doneBarButton.isEnabled = false
        } else {
            doneBarButton.isEnabled = true
        }
        
        return true
        
    }
    
    
}


