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
    var timer = Timer()
    var cycle = Double()
    let defaults = UserDefaults.standard
    @IBOutlet var nameLabels: [UILabel]!
    @IBOutlet weak var startButton: UIButton!
    
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
        cycle = 2.0
    }
    
    func resetTimer() {
        cycle += 0.2
        timer.invalidate()
        timer = Timer.scheduledTimer(timeInterval: cycle, target: self, selector: #selector(updateDisplay), userInfo: nil, repeats: true)
    }
    
    @objc func updateDisplay() {
        resetTimer()
        var nameLabelIndices = [Int]()
        for i in 0..<nameLabels.count {
            if nameLabels[i].text != "" {
                nameLabelIndices.append(i)
            }
        }
        let randomPick = Int(arc4random_uniform(UInt32(nameLabelIndices.count)))
        nameLabels[nameLabelIndices[randomPick]].text = ""
        if nameLabelIndices.count <= 2 {
            timer.invalidate()
            startButton.setTitle("Reset", for: .normal)
            startButton.backgroundColor = UIColor.yellow
        }
    }
    
    @IBAction func onStartButtonTapped(_ sender: UIButton) {
        let title = sender.titleLabel!.text!
        switch title {
        case "Start" :
            resetTimer()
            sender.setTitle("Stop", for: .normal)
            sender.backgroundColor = UIColor.red
        case "Stop" :
            timer.invalidate()
            sender.setTitle("Reset", for: .normal)
            sender.backgroundColor = UIColor.yellow
        default:
            updateDisplay()
            sender.setTitle("Start", for: .normal)
            sender.backgroundColor = UIColor.green
            resetNames()
        }
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let dvc = segue.destination as! NamesTableViewController
        dvc.period = period
    }
}
