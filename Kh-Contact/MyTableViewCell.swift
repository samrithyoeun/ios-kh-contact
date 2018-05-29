//
//  MyTableViewCell.swift
//  Kh-Contact
//
//  Created by Samrith Yoeun on 5/26/18.
//  Copyright © 2018 samrith. All rights reserved.
//

import UIKit

class MyTableViewCell: UITableViewCell {
    
    @IBOutlet weak var logo: UIImageView!
    @IBOutlet weak var englishName: UILabel!
    @IBOutlet weak var phone: UILabel!
    @IBOutlet weak var khmerName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func loadDataToCell( with contact : Contact){
        self.khmerName.text = contact.khmerName
        self.englishName.text = contact.englishName
        self.phone.text = contact.phone
        self.logo.image = UIImage(named : contact.logo.replacingOccurrences(of: " ", with: "").lowercased())
    }

}
