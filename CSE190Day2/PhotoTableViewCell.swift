//
//  PhotoTableViewCell.swift
//  CSE190Day2
//
//  Created by Martin Gao on 10/6/15.
//  Copyright © 2015 SirioLabs. All rights reserved.
//

import UIKit

class PhotoTableViewCell: UITableViewCell {

    var addressImageView:UIImageView = UIImageView();
    var authorLabel:UILabel = UILabel();

    init(){
        super.init(style: UITableViewCellStyle.Default, reuseIdentifier: nil)

        self.addressImageView.contentMode = UIViewContentMode.ScaleAspectFit

        self.contentView.addSubview(self.addressImageView)
        self.addressImageView.autoPinEdgeToSuperviewEdge(ALEdge.Top, withInset: 5)
        self.addressImageView.autoPinEdgeToSuperviewEdge(ALEdge.Leading, withInset: 5)
        self.addressImageView.autoSetDimension(ALDimension.Height, toSize: 50)
        self.addressImageView.autoPinEdgeToSuperviewEdge(ALEdge.Bottom, withInset: 5)

        self.contentView.addSubview(self.authorLabel)
        self.authorLabel.autoPinEdge(ALEdge.Leading, toEdge: ALEdge.Trailing, ofView: self.addressImageView, withOffset: 10)
    }


    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


}
