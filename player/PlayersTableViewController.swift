//
//  PlayersTableViewController.swift
//  player
//
//  Created by Alex Hsieh on 2017/11/20.
//  Copyright © 2017年 Alex Hsieh. All rights reserved.
//

import UIKit

class PlayersTableViewController: UITableViewController {

   
    @IBOutlet var playerImage: [UIImageView]!
    @IBOutlet var nameLabel: [UILabel]!
    
    
    var players = [Playinfo]()

    struct PropertyKey {
        static let playerDetailSegue = "PlayerDetail"
    }
    /*
    //利用unwind segue回到列表
    @IBAction func unwingSegueToPlayersTableView(segue:UIStoryboardSegue){
        let source = segue.source as? EditTableViewController
        if let player = source?.playerEdit ,let row = tableView.indexPathForSelectedRow?.row {
            players[row] = player
            nameLabel[row].text = player.name
        }
    }
    */
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        
        
        self.tableView.backgroundView = UIImageView(image: UIImage(named: "logo3"))
        self.tableView.backgroundView?.alpha = 0.5
        self.tableView.backgroundView?.contentMode = UIViewContentMode.scaleAspectFill
        
        players.append(Playinfo(name: "STEPHEN CURRY", num: "30", imageName: "STEPHEN CURRY", position: "後衛"))
        players.append(Playinfo(name: "ANDRE IGUODALA", num: "9", imageName: "ANDRE IGUODALA",position:"後衛-前鋒"))
        players.append(Playinfo(name: "DRAYMOND GREEN", num: "23", imageName: "DRAYMOND GREEN", position: "前鋒"))
        players.append(Playinfo(name: "KEVIN DURANT", num: "35", imageName: "KEVIN DURANT", position: "前鋒"))
        players.append(Playinfo(name: "KLAY THOMPSON", num: "11", imageName: "KLAY THOMPSON", position: "後衛"))
        
        
        for i in 0..<nameLabel.count{
            nameLabel[i].text = players[i].name
            playerImage[i].image = UIImage(named:players[i].imageName)
        }
        
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        for i in 0..<nameLabel.count{
            nameLabel[i].text = players[i].name
            playerImage[i].image = UIImage(named:players[i].imageName)
        }
                    
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    override func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: PropertyKey.playerDetailSegue, sender: nil)
    }
     */
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
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
       
            let PlayerDetail = segue.destination as? PlayerDetailTableViewController
            if let indexPath = tableView.indexPathForSelectedRow{
                PlayerDetail?.playerDetail = players[indexPath.row]
            
        }
    }

}
