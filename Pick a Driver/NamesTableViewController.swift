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

    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */

    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
     tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */

    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

     }
     */

    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */

    @IBAction func onPlusButtonTapped(_ sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "Add a name", message: nil,
                                      preferredStyle: .alert)
        alert.addTextField { (textField) in
            textField.placeholder = "Name"
        }
        let cancelAction = UIAlertAction(title: "Cancel",
                                         style: .cancel, handler: nil)
        alert.addAction(cancelAction)
        let appendAction = UIAlertAction(title: "Add",
                                         style: .default) { (action) in
                                            let nameTextField = alert.textFields![0] as UITextField
                                            let name = nameTextField.text!
                                            self.names.append(name)
                                            self.tableView.reloadData()
        }
        alert.addAction(appendAction)
        present(alert, animated: true, completion: nil)
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
