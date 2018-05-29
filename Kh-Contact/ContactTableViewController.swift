//
//  ContactTableViewController.swift
//  Kh-Contact
//
//  Created by Samrith Yoeun on 5/25/18.
//  Copyright © 2018 samrith. All rights reserved.
//

import UIKit

class ContactTableViewController: UITableViewController {
    
    var contacts = [Contact]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 150
        
        let data = Database()
        contacts = data.getAllContact()!
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        return contacts.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

  
        // Configure the cell...
        let cell = tableView.dequeueReusableCell(withIdentifier: "customcell") as! MyTableViewCell
            cell.loadDataToCell(with: contacts[indexPath.row])
            return cell
    }


    

}
