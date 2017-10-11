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
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChecklistItem", for: indexPath)
        
        // creating label with specific tag
        let label = cell.viewWithTag(1000) as! UILabel
        
        if indexPath.row == 0 {
            label.text = "Run a marathon"
        } else {
            label.text = "Sleep"
        }
        
        
        return cell
        
    }

}
