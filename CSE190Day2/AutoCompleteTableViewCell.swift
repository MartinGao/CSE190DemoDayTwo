//
//  AutoCompleteTableViewCell.swift
//  CSE190Day2
//
//  Created by Martin Gao on 10/6/15.
//  Copyright © 2015 SirioLabs. All rights reserved.
//

import UIKit

class AutoCompleteTableViewCell: UITableViewCell {

    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var placeIdLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
