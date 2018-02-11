//
//  NamesTableViewController.swift
//  Pick a Driver
//
//  Created by tbredemeier on 2/11/18.
//  Copyright © 2018 tbredemeier. All rights reserved.
//

import UIKit

class NamesTableViewController: UITableViewController {

    var names = ["Tony", "Tina", "Sally", "Ralph", "Eunice", "Charlie"]

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.isEditing = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = names[indexPath.row]
        return cell
    }

    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            self.names.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }

    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        let nameToMove = names.remove(at: fromIndexPath.row)
        names.insert(nameToMove, at: to.row)
    }

    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    @IBAction func onPlusButtonTapped(_ sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "Add a name", message: nil,
                                      preferredStyle: .alert)
        alert.addTextField { (textField) in
            textField.placeholder = "Name"
        }
        let cancelAction = UIAlertAction(title: "Cancel",
                                         style: .cancel, handler: nil)
        alert.addAction(cancelAction)
        let appendAction = UIAlertAction(title: "OK",
                                         style: .default) { (action) in
                                            let nameTextField = alert.textFields![0] as UITextField
                                            let name = nameTextField.text!
                                            self.names.append(name)
                                            self.tableView.reloadData()
        }
        alert.addAction(appendAction)
        present(alert, animated: true, completion: nil)
    }
}
