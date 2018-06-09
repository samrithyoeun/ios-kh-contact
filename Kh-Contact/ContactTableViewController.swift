//
//  ContactTableViewController.swift
//  Kh-Contact
//
//  Created by Samrith Yoeun on 5/25/18.
//  Copyright © 2018 samrith. All rights reserved.
//

import UIKit

class ContactTableViewController: UITableViewController, UISearchBarDelegate {
    
    var contacts = [Contact]()
    var currentContacts = [Contact]()
    
    @IBOutlet var table: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBar.delegate = self
        searchBar.placeholder = "Serach in English name"
        searchBarPositioning()
        
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 150
        
        let data = Database()
        contacts = data.getAllContact()!
        currentContacts = contacts
        
        

        }
    // MARK: - Place search bar in the section header of the tableview
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return searchBar
    }
    func searchBarPositioning(){
        table.tableHeaderView = UIView()
        table.estimatedSectionHeaderHeight = 100
        table.sectionHeaderHeight = UITableViewAutomaticDimension
    }
    
    // MARK: -Text Didchange of Searchbar
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
      
        
        guard !searchText.isEmpty
            else {
                currentContacts = contacts
                return
        }
        
        currentContacts = contacts.filter({ (contact) -> Bool in
            return contact.englishName.lowercased().replacingOccurrences(of: " ", with: "")
            .contains(searchText.lowercased().replacingOccurrences(of: " ", with: "") ) ?true :
            contact.khmerName.contains(searchText)
        
        })
            
        
        
        print(searchText)
        table.reloadData()
        
        
        }
    
    
        
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currentContacts.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

  
        // Configure the cell...
        let cell = tableView.dequeueReusableCell(withIdentifier: "customcell") as! MyTableViewCell
            cell.loadDataToCell(with: currentContacts[indexPath.row])
            return cell
    }


    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let strPhoneNumber = currentContacts[indexPath.row].phone
        if let phoneCallURL:URL = URL(string: "tel://\(strPhoneNumber)")
        {
            let application:UIApplication = UIApplication.shared
                if application.canOpenURL(phoneCallURL)
                {
                    application.open(phoneCallURL, options: [:], completionHandler: nil)
                    tableView.deselectRow(at: indexPath, animated: true)
                }
            
        }
        
        // MARK: - alert dialog
        /*
        if (application.canOpenURL(phoneCallURL)) {
                let alertController = UIAlertController(title: "Kh-Contacts", message: "Are you sure you want to call \n\(strPhoneNumber)?", preferredStyle: .alert)
                let yesPressed = UIAlertAction(title: "Yes", style: .default, handler: { (action) in
                    
                    
                })
                let noPressed = UIAlertAction(title: "No", style: .default, handler: { (action) in
                    
                })
                alertController.addAction(yesPressed)
                alertController.addAction(noPressed)
                present(alertController, animated: true, completion: nil)
            }
        */
        }
 
 }
 


