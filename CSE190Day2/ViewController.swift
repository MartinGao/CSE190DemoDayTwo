//
//  ViewController.swift
//  CSE190Day2
//
//  Created by Martin Gao on 10/6/15.
//  Copyright © 2015 SirioLabs. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    @IBOutlet weak var addressTextField: UITextField!

    override func viewWillAppear(animated: Bool) {
        print("viewWillAppear ViewController")

    }

    override func viewWillDisappear(animated: Bool) {
        print("viewWillDisappear ViewController")

    }
    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad ViewController")
    }

    override func viewDidAppear(animated: Bool) {
        print("viewDidAppear ViewController")
    }

    @IBOutlet weak var searchAddress: UIButton!
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func searchAddressAction(sender: AnyObject) {


    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let vc = segue.destinationViewController as! AddressResultsTableViewController;
        vc.addressString = self.addressTextField.text!;
    }


}

