//
//  DisplayViewController.swift
//  Pick a Driver
//
//  Created by tbredemeier on 2/11/18.
//  Copyright © 2018 tbredemeier. All rights reserved.
//

import UIKit

class DisplayViewController: UIViewController {

    var period = String()

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let dvc = segue.destination as! NamesTableViewController
        dvc.period = period
    }
}
