//
//  TableViewUITTableViewCell.swift
//  AllFunc
//
//  Created by lanet on 11/02/18.
//  Copyright © 2018 lanet. All rights reserved.
//

import UIKit

class TableViewUITTableViewCell: UITableViewCell {

    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var mainHeadinglbl: UILabel!
    @IBOutlet weak var subHeadinglbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
