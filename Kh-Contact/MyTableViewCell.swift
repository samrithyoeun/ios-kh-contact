//
//  MyTableViewCell.swift
//  Kh-Contact
//
//  Created by Samrith Yoeun on 5/26/18.
//  Copyright © 2018 samrith. All rights reserved.
//

import UIKit

class MyTableViewCell: UITableViewCell {

    @IBOutlet weak var name: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
