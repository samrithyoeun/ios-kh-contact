//
//  Contact.swift
//  Kh-Contact
//
//  Created by Samrith Yoeun on 5/25/18.
//  Copyright © 2018 samrith. All rights reserved.
//

import Foundation
import SQLite

class Contact{
    var id : Int
    var englishName : String
    var khmerName : String
    var phone : String
    var logo : String
    
    init(id : Int ,englishName : String, khmerName : String, phone : String , logo : String){
        self.id = id
        self.englishName = englishName
        self.khmerName = khmerName
        self.phone = phone
        self.logo = logo
    }
    
    
}


class Database{
    let phonebook = Table("tblPhoneBook")
    let id = Expression<Int>("id")
    let phone = Expression<String>("phone")
    let englishName = Expression<String>("engName")
    let khmerName = Expression<String>("khName")
    let logo = Expression<String>("logo")
    var database : Connection!
    
    init(){
        do{
            if self.database == nil {
                print("database is nil")
                self.database = try Connection(Bundle.main.path(forResource: "contact", ofType: "sqlite")!)
            }else {
                print("database is connected")
            }
        }catch{ print(error) }
    }
    
    func getAllContact()->[Contact]?{
        var contacts = [Contact]()
        for contact in try! database.prepare(phonebook) {
            print(String(describing: contact) + "\n")
            contacts.append(Contact(id: contact[id], englishName: contact[englishName], khmerName: contact[khmerName], phone: contact[phone], logo: contact[logo]))
        }
        return contacts
    }
}

