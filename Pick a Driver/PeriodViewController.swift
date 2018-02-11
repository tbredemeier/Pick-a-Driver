//
//  PeriodViewController.swift
//  Pick a Driver
//
//  Created by tbredemeier on 2/11/18.
//  Copyright © 2018 tbredemeier. All rights reserved.
//

import UIKit

class PeriodViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onPeriodButtonTapped(_ sender: UIButton) {
        performSegue(withIdentifier: "PeriodToNamesSegue", sender: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
