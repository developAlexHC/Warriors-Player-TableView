//
//  EditPlayerTableViewController.swift
//  player
//
//  Created by Alex Hsieh on 2017/11/20.
//  Copyright © 2017年 Alex Hsieh. All rights reserved.
//

import UIKit

class PlayerDetailTableViewController: UITableViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var positionTextField: UITextField!
    @IBOutlet weak var numTextField: UITextField!
    
    var playerDetail:Playinfo?
    
    /*
    @IBAction func unwingSegueToDetail(segue:UIStoryboardSegue){
        let source = segue.source as? EditTableViewController
        if let player = source?.playerEdit ,let row = tableView.indexPathForSelectedRow?.row {
            nameTextField.text = player.name
            //positionTextField.text = player.position
            //numTextField.text = player.num
            print(player.name)
        }
    }
    */
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        navigationController?.navigationBar.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        
        
        self.tableView.backgroundView = UIImageView(image: UIImage(named: "logo3"))
        self.tableView.backgroundView?.alpha = 0.5
        self.tableView.backgroundView?.contentMode = UIViewContentMode.scaleAspectFill
        
        
        if let player = playerDetail {
            nameTextField.text = player.name
            imageView.image = UIImage(named:player.imageName)
            positionTextField.text = player.position
            numTextField.text = player.num
            navigationItem.title = player.name
        }
        
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let EditPlayer = segue.destination as? EditTableViewController
        EditPlayer?.playerEdit = self.playerDetail
        
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    

}