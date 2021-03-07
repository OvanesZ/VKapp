//
//  MainScreenForGroupTableViewController.swift
//  VKapp
//
//  Created by Ovanes on 26.02.2021.
//

import UIKit

class MainScreenForGroupTableViewController: UITableViewController {
    
//    fileprivate let groups = [
//        Groups(name: "Кино"),
//        Groups(name: "Музыка"),
//        Groups(name: "Хобби"),
//        Groups(name: "Спорт")
//    ]
    
    var myGroups = [
        MyGroups(name: "Кино", groupImage: UIImage(named: "image_560708111244079913687")),
        MyGroups(name: "Музыка", groupImage: UIImage(named: "image_560708111244079913687")),
        MyGroups(name: "Хобби", groupImage: UIImage(named: "image_560708111244079913687")),
        MyGroups(name: "Спорт", groupImage: UIImage(named: "image_560708111244079913687"))
    ]
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func searchGroupsButton(_ sender: UIBarButtonItem) {
        
        performSegue(withIdentifier: "searchGroups", sender: self)
        
    }
    

    // MARK: - Table view data source
    
    
    @IBAction func addGroup(segue: UIStoryboardSegue) {
          
        if let groupViewController = segue.source as? ScreenAreNotMyGroupsViewController,
           let selectedIndexPath = groupViewController.tableView.indexPathForSelectedRow {
            let selectedGroup = groupViewController.groups[selectedIndexPath.row]
            
            if !myGroups.contains(selectedGroup) {
                myGroups.append(selectedGroup)
                tableView.reloadData()
            }
        }
    }

    
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return myGroups.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       guard let cell = tableView.dequeueReusableCell(withIdentifier: "MyCellGroups", for: indexPath) as? GroupCell else { return UITableViewCell() }

        // Configure the cell...
        //cell.groupsLabel.text = groups[indexPath.row].name
        cell.configure(with: myGroups[indexPath.item])

        

        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            //tableView.deleteRows(at: [indexPath], with: .fade)
            myGroups.remove(at: indexPath.row)
            //tableView.reloadData()
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
        }
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
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
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


