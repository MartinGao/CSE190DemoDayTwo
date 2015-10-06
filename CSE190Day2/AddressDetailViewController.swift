//
//  AddressDetailViewController.swift
//  CSE190Day2
//
//  Created by Martin Gao on 10/6/15.
//  Copyright © 2015 SirioLabs. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class AddressDetailViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    var nameLabel:UILabel = UILabel();
    var latitudeLabel:UILabel   = UILabel();
    var longitudeLabel:UILabel  = UILabel();

    var placeId:String!;

    var photosTable = UITableView();
    var photosArray = JSON([]);

    override func viewWillAppear(animated: Bool) {
        self.view.backgroundColor = UIColor.whiteColor()

        self.view.addSubview(self.nameLabel)
        self.nameLabel.autoPinEdgesToSuperviewEdgesWithInsets(UIEdgeInsets(top: 80, left: 10, bottom: 10, right: 10), excludingEdge: ALEdge.Bottom)
        self.nameLabel.textAlignment = NSTextAlignment.Center;

        self.view.addSubview(self.latitudeLabel)
        self.latitudeLabel.autoPinEdge(ALEdge.Top, toEdge: ALEdge.Bottom, ofView: self.nameLabel, withOffset: 10)
        self.latitudeLabel.autoPinEdgeToSuperviewEdge(ALEdge.Left, withInset: 20)

        self.view.addSubview(self.longitudeLabel)
        self.longitudeLabel.autoPinEdge(ALEdge.Top, toEdge: ALEdge.Bottom, ofView: self.nameLabel, withOffset: 10)
        self.longitudeLabel.autoPinEdge(ALEdge.Leading, toEdge: ALEdge.Trailing, ofView: self.latitudeLabel, withOffset: 10)
        self.longitudeLabel.autoPinEdgeToSuperviewEdge(ALEdge.Trailing, withInset: 20)

        self.view.addSubview(self.photosTable)
        self.photosTable.autoPinEdge(ALEdge.Top, toEdge: ALEdge.Bottom, ofView: self.longitudeLabel, withOffset: 20)
        self.photosTable.autoPinEdgeToSuperviewEdge(ALEdge.Left, withInset: 5)
        self.photosTable.autoPinEdgeToSuperviewEdge(ALEdge.Right, withInset: 5)
        self.photosTable.autoPinEdgeToSuperviewEdge(ALEdge.Bottom, withInset: 5)

        self.photosTable.delegate = self;
        self.photosTable.dataSource = self;
    }

    override func viewDidAppear(animated: Bool) {
        self.queryDetail();
        self.photosTable.rowHeight = UITableViewAutomaticDimension
        self.photosTable.estimatedRowHeight = 44.0
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


    func queryDetail(){
        Alamofire.request(.GET, "https://maps.googleapis.com/maps/api/place/details/json?", headers: nil, parameters: [
            "placeid": self.placeId,
            "key": "AIzaSyDG-YvI2ybt9g16HvKLtkUODP-lekZBjfI",
            ]).responseJSON(completionHandler: {(request, response, result) in
                if let val = result.value {
                    print("queryDetail Done!")
//                    print(val)
                    var JSONObj = JSON(val);
                    self.nameLabel.text         = JSONObj["result"]["name"].stringValue;
                    self.latitudeLabel.text     = JSONObj["result"]["geometry"]["location"]["lat"].stringValue;
                    self.longitudeLabel.text    = JSONObj["result"]["geometry"]["location"]["lng"].stringValue;
                    self.photosArray            = JSONObj["result"]["photos"];
                    self.photosTable.reloadData()
                }
        })
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell:PhotoTableViewCell = PhotoTableViewCell();
        var url = "https://maps.googleapis.com/maps/api/place/photo?maxwidth=100&key=AIzaSyDG-YvI2ybt9g16HvKLtkUODP-lekZBjfI&photoreference=" + self.photosArray[indexPath.row]["photo_reference"].stringValue;
        print(url);
        cell.addressImageView.sd_setImageWithURL(NSURL(string: url ))

        let str = self.photosArray[indexPath.row]["html_attributions"][0].stringValue.stringByReplacingOccurrencesOfString("<[^>]+>", withString: "", options: .RegularExpressionSearch, range: nil)

        cell.authorLabel.text = str;
        return cell;

    }

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1;
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.photosArray.count;
    }

}
