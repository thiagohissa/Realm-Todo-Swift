//
//  TableViewCell.swift
//  RealmStretchyList
//
//  Created by Thiago Hissa on 2017-08-04.
//  Copyright © 2017 Thiago Hissa. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var cellDateLabel: UILabel!
    @IBOutlet weak var cellMainLabel: UILabel!
    @IBOutlet weak var cellImage: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
