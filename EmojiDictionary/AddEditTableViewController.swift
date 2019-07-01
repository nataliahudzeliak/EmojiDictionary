//
//  AddEditTableViewController.swift
//  EmojiDictionary
//
//  Created by MacOS on 3/6/19.
//  Copyright © 2019 MacOS. All rights reserved.
//

import UIKit

class AddEditTableViewController: UITableViewController {
    
    var emoji: Emoji?
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    @IBOutlet weak var symbolField: UITextField!
    
    @IBOutlet weak var nameField: UITextField!
    
    @IBOutlet weak var descriptionField: UITextField!
    
    @IBOutlet weak var usageField: UITextField!
    
    
    func updateSaveButtonState(){
        let symbolText = symbolField.text ?? ""
        let nameText = nameField.text ?? ""
        let descriptionText = descriptionField.text ?? ""
        let usageText = usageField.text ?? ""
        
        saveButton.isEnabled = !symbolText.isEmpty && !nameText.isEmpty && !descriptionText.isEmpty && !usageText.isEmpty
    }
    
    @IBAction func textEditingChanged(_ sender: Any) {
        updateSaveButtonState()
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        guard segue.identifier == "saveSegue" else {return}
        let symbol = symbolField.text ?? ""
        let name = nameField.text ?? ""
        let description = descriptionField.text ?? ""
        let usage = usageField.text ?? ""
        
        
        emoji = Emoji(symbol: symbol, name: name, description: description, usage: usage)
        
        
        
    }
  
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let emoji = emoji {
            symbolField.text = emoji.symbol
            nameField.text = emoji.name
            descriptionField.text = emoji.description
            usageField.text = emoji.usage
            
        }
        updateSaveButtonState()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

   

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
