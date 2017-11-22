//
//  EditTableViewController.swift
//  player
//
//  Created by Alex Hsieh on 2017/11/21.
//  Copyright © 2017年 Alex Hsieh. All rights reserved.
//

import UIKit

class EditTableViewController: UITableViewController,UIPickerViewDataSource,UIPickerViewDelegate{

    @IBOutlet weak var playerImage: UIImageView!
    @IBOutlet weak var playernameTextField: UITextField!
    @IBOutlet weak var positionTextField: UITextField!
    @IBOutlet weak var numTextField: UITextField!
    
    var position = ["前鋒","中鋒","後衛"]
    var playerEdit: Playinfo?
    var picker = UIPickerView()

    
    //設定pickerview
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    //幾個區塊
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    //顯示幾列
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return position.count
    }
    //每列pickerView要顯示的內容
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return position[row]
    }
    //選到要做的事情
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        positionTextField.text = position[row]
    }
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    //點任意地方收鍵盤
    @IBAction func closeKeyBoardGesture(_ sender: Any) {
        view.endEditing(true)
    }
    
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    //利用doneButton來回到第一頁，使用pop方法，並跳出Alert的功能

    @IBAction func doneButton(_ sender: UIBarButtonItem) {
    
            let count = self.navigationController?.viewControllers.count
            let playersTableViewController = navigationController?.viewControllers[count!-3] as? PlayersTableViewController
            if let row = playersTableViewController?.tableView.indexPathForSelectedRow?.row , var player = playerEdit{
                
                player.name = playernameTextField.text ?? ""
                player.num = numTextField.text ?? ""
                player.position = positionTextField.text ?? ""
                playersTableViewController?.players[row] = player
                print(player.name)
            }
            //popToRootViewController回到第一頁
            navigationController?.popToRootViewController(animated: true)
        
        
        //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
        //設定Alert顯示的內容
        let alert = UIAlertController(title: "Done", message: "編輯完成", preferredStyle: .alert)
        //設定ok的button
        let OkAction = UIAlertAction(title: "OK", style: .default) { (action:UIAlertAction) in
            self.dismiss(animated: true, completion: nil)}
        alert.addAction(OkAction)
        present(alert, animated: true , completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
        //設定背景圖片
        self.tableView.backgroundView = UIImageView(image: UIImage(named: "logo3"))
        self.tableView.backgroundView?.alpha = 0.5
        self.tableView.backgroundView?.contentMode = UIViewContentMode.scaleAspectFill
        
        //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
        //設定datasource跟delegate來源為UITableViewController
        picker.dataSource = self
        picker.delegate = self
        //將TextField輸入改成pickerview
        positionTextField.inputView = picker
        
        
        
        if let player = playerEdit {
            playernameTextField.text = player.name
            playerImage.image = UIImage(named:player.imageName)
            positionTextField.text = player.position
            numTextField.text = String(player.num)
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        playerEdit?.name = playernameTextField.text ?? ""
        playerEdit?.num = numTextField.text ?? ""
        playerEdit?.position = positionTextField.text ?? ""
        
        print(playernameTextField.text)
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
