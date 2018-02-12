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
    var names = [String]()
    let defaults = UserDefaults.standard
    @IBOutlet var nameLabels: [UILabel]!

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = period
    }

    override func viewWillAppear(_ animated: Bool) {
        if let savedData = defaults.object(forKey: period) as?
            [String] {
            names = savedData
        }
        resetNames()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func resetNames() {
        for i in 0..<min(names.count, nameLabels.count) {
            nameLabels[i].text = names[i]
        }
    }
    

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let dvc = segue.destination as! NamesTableViewController
        dvc.period = period
    }
}
