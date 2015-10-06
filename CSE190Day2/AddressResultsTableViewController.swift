//
//  AddressResultsTableViewController.swift
//  CSE190Day2
//
//  Created by Martin Gao on 10/6/15.
//  Copyright © 2015 SirioLabs. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON


class AddressResultsTableViewController: UITableViewController {

    var addressString:String = "";

    var addressArray:JSON! = JSON([]);

    var detailVC:AddressDetailViewController = AddressDetailViewController();

    func search(address:String!){

        Alamofire.request(.GET, "https://maps.googleapis.com/maps/api/place/autocomplete/json?", headers: nil, parameters: [
            "input": addressString,
            "key": "AIzaSyDG-YvI2ybt9g16HvKLtkUODP-lekZBjfI",
            ]).responseJSON(completionHandler: {(request, response, result) in
            if let jj = result.value {
                let a = JSON(jj)
                self.addressArray = a["predictions"];
//                self.addressArray = JSON;
                self.tableView.reloadData();
            }
        })
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        self.search(self.addressString)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1;
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.addressArray.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell:AutoCompleteTableViewCell = tableView.dequeueReusableCellWithIdentifier("AutoCompleteCell") as! AutoCompleteTableViewCell;
        cell.descriptionLabel.text  = self.addressArray[indexPath.row]["description"].string;
        cell.placeIdLabel.text      = "Google Place Id : " + self.addressArray[indexPath.row]["place_id"].string!;
        return cell;
    }

    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.detailVC.placeId = self.addressArray[indexPath.row]["place_id"].string!;
        self.navigationController?.pushViewController(detailVC, animated: true);
    }

}