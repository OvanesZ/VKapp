//
//  MainScreenForGroupTableViewController.swift
//  VKapp
//
//  Created by Ovanes on 26.02.2021.
//

import UIKit
import Alamofire

class MainScreenForGroupTableViewController: UITableViewController {
    

    
    var myGroups: [MyGroups] = []
  
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    }

    
    @IBAction func searchGroupsButton(_ sender: UIBarButtonItem) {
        
        performSegue(withIdentifier: "searchGroups", sender: self)
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let userToken = Session.shared.token
        
       loadGroup(token: userToken, completion: { result in
                        switch result {
                        case let .failure(error):
                            print(error)
                        case let .success(groups):
                            let newMyGroups: [MyGroups] = groups
                            self.myGroups = newMyGroups
                            
                            
                            
                            self.tableView.reloadData()
                        }
                    })
        
    }

    // MARK: - Table view data source
    
    
//    @IBAction func addGroup(segue: UIStoryboardSegue) {
//
//        if let groupViewController = segue.source as? ScreenAreNotMyGroupsViewController,
//           let selectedIndexPath = groupViewController.tableView.indexPathForSelectedRow {
//            let selectedGroup = groupViewController.groups[selectedIndexPath.row]
//
//            if !myGroups.contains(selectedGroup) {
//                myGroups.append(selectedGroup)
//                tableView.reloadData()
//            }
//        }
//    }
//
//
//
//
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
        cell.groupsLabel.text = myGroups[indexPath.row].name
        cell.configure(with: myGroups[indexPath.item])

        return cell
    }
    
    
//    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
//        if editingStyle == .delete {
//            // Delete the row from the data source
//            //tableView.deleteRows(at: [indexPath], with: .fade)
//            myGroups.remove(at: indexPath.row)
//            //tableView.reloadData()
//            tableView.deleteRows(at: [indexPath], with: .fade)
//        }
//        }
//
   }
    


