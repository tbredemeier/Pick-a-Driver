//
//  PeriodViewController.swift
//  Pick a Driver
//
//  Created by tbredemeier on 2/11/18.
//  Copyright © 2018 tbredemeier. All rights reserved.
//

import UIKit

class PeriodViewController: UIViewController {

    var period = String()

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func onPeriodButtonTapped(_ sender: UIButton) {
        period = (sender.titleLabel?.text)!
        performSegue(withIdentifier: "PeriodToNamesSegue", sender: nil)
    }

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let dvc = segue.destination as! NamesTableViewController
        dvc.period = period
    }
}
